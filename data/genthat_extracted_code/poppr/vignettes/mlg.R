## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(message = FALSE, warning = FALSE, tidy = FALSE)
knitr::opts_chunk$set(fig.align = "center", fig.show = 'asis')

## ---- warning = TRUE-----------------------------------------------------
library("poppr")
data(monpop)
monpop
head(mll(monpop, "original"), 20) # Showing the definitions for the first 20 samples

## ------------------------------------------------------------------------
mll(monpop) <- "original"
monpop

## ------------------------------------------------------------------------
mll(monpop) <- "custom"
monpop

## ------------------------------------------------------------------------
head(mll(monpop, "custom"), 20) # Showing the definitions for the first 20 samples

## ------------------------------------------------------------------------
mll(monpop) <- "original"
monpop

## ------------------------------------------------------------------------
grid_example <- matrix(c(1, 4,
                         1, 1,
                         5, 1,
                         9, 1,
                         9, 4),
                       ncol = 2,
                       byrow = TRUE)
rownames(grid_example) <- LETTERS[1:5]
colnames(grid_example) <- c("x", "y")
grid_example

## ------------------------------------------------------------------------
library("poppr")
x <- as.genclone(df2genind(grid_example, ploidy = 1))
tab(x)  # Look at the multilocus genotype table
nmll(x) # count the number of multilocus genotypes
mll(x)  # show the multilocus genotype definitions

## ------------------------------------------------------------------------
x <- as.genclone(df2genind(rbind(grid_example, new = c(5, NA)), ploidy = 1))
tab(x)  # Note the missing data at locus 2.
nmll(x)
mll(x)

## ------------------------------------------------------------------------
grid_new <- rbind(grid_example,
                  new = c(5, NA),
                  mut = c(5, 2)
                  )
x <- as.genclone(df2genind(grid_new, ploidy = 1))
tab(x)
nmll(x)
mll(x)

## ------------------------------------------------------------------------
(xt <- apply(tab(x), 1, paste, collapse = ""))
rank(xt, ties.method = "first")

## ---- fig.width = 5, fig.height = 5--------------------------------------
library("phangorn")
library("ape")
raw_dist <- function(x){
  dist(genind2df(x, usepop = FALSE))
}
(xdis <- raw_dist(x))
plot.phylo(upgma(xdis))

## ------------------------------------------------------------------------
x # We have 7 MLGs before filtering
mlg.filter(x, distance = xdis) <- 1 + .Machine$double.eps^0.5
x # Now we have 5 MLGs
mll(x) <- "original" # We'll reset to the naive definition

## ------------------------------------------------------------------------
mll(x, "original")
mlg.filter(x, distance = xdis, threshold = 1, stats = c("mlg", "thresholds"))

## ------------------------------------------------------------------------
(e <- .Machine$double.eps^0.5) # A very tiny number
mlg.filter(x, distance = xdis, threshold = 1 + e, stats = c("mlg", "thresholds"))

## ------------------------------------------------------------------------
mlg.filter(x, distance = xdis, threshold = 0, stats = c("mlg", "thresholds"))
mll(x, "original")

## ------------------------------------------------------------------------
x
mlg.table(x) # Before: 7 MLGs
mlg.filter(x, distance = xdis) <- 1 + e
x
mlg.table(x) # After: 5 MLGs

## ------------------------------------------------------------------------
mlg.filter(x) <- 4.51
x
mlg.table(x)

## ---- errors = TRUE------------------------------------------------------
rm(xdis) # NOOOOOO!
try(mlg.filter(x) <- 1 + e)

## ---- echo = FALSE-------------------------------------------------------
cat(" Error: cannot evaluate distance function, it might be missing.")

## ------------------------------------------------------------------------
mlg.filter(x, distance = raw_dist) <- 1 + e
x

## ------------------------------------------------------------------------
bruvo.dist(x, replen = c(1, 1))
mlg.filter(x, distance = bruvo.dist, replen = c(1, 1)) <- 0.44
x

## ------------------------------------------------------------------------
mll(x, "original")
mll(x) # contracted
mll(x) <- "original"
mll(x) # original

## ----plot_replen---------------------------------------------------------
data(Pinf)
Pinf
pinfreps <- fix_replen(Pinf, c(2, 2, 6, 2, 2, 2, 2, 2, 3, 3, 2))
pinf_filtered <- filter_stats(Pinf, distance = bruvo.dist, replen = pinfreps, plot = TRUE)

## ----cutof_predictor-----------------------------------------------------
print(farthest_thresh <- cutoff_predictor(pinf_filtered$farthest$THRESHOLDS))
print(average_thresh  <- cutoff_predictor(pinf_filtered$average$THRESHOLDS))
print(nearest_thresh  <- cutoff_predictor(pinf_filtered$nearest$THRESHOLDS))

## ----pinf_thresh---------------------------------------------------------
mlg.filter(Pinf, distance = bruvo.dist, replen = pinfreps, algorithm = "f") <- farthest_thresh
Pinf

## ------------------------------------------------------------------------
data(partial_clone)
pc <- as.genclone(partial_clone)
mll(pc)

## ------------------------------------------------------------------------
LETTERS[mll(pc)]  # The new MLGs
mll.custom(pc) <- LETTERS[mll(pc)]
mlg.table(pc)

## ------------------------------------------------------------------------
pcpal <- colorRampPalette(c("blue", "gold"))
set.seed(9001)
pcmsn <- bruvo.msn(pc, replen = rep(1, nLoc(pc)), palette = pcpal,
                   vertex.label.color = "firebrick", vertex.label.font = 2,
                   vertex.label.cex = 1.5)

## ------------------------------------------------------------------------
mll.levels(pc)[mll.levels(pc) == "Q"] <- "M"

## ------------------------------------------------------------------------
set.seed(9001)
pcmsn <- bruvo.msn(pc, replen = rep(1, nLoc(pc)), palette = pcpal,
                   vertex.label.color = "firebrick", vertex.label.font = 2,
                   vertex.label.cex = 1.5)

## ------------------------------------------------------------------------
data(monpop)
splitStrata(monpop) <- ~Tree/Year/Symptom
montab <- mlg.table(monpop, strata = ~Symptom/Year)

## ------------------------------------------------------------------------
(monstat <- diversity_stats(montab))

## ---- message = TRUE, warning = TRUE-------------------------------------
diversity_ci(montab, n = 100L, raw = FALSE)

## ------------------------------------------------------------------------
myCF <- function(x){
 x <- drop(as.matrix(x))
 if (length(dim(x)) > 1){ # if it's a matrix
   res <- rowSums(x > 0)/rowSums(x)
 } else {                 # if it's a vector
   res <- sum(x > 0)/sum(x)
 }
 return(res)
}
(monstat2 <- diversity_stats(montab, CF = myCF))

## ---- eval = FALSE-------------------------------------------------------
#  # Repeat lengths are necessary
#  reps <- fix_replen(monpop,
#                     c(CHMFc4 = 7, CHMFc5 = 2, CHMFc12 = 4,
#                       SEA = 4, SED = 4, SEE = 2, SEG = 6,
#                       SEI = 3, SEL = 4, SEN = 2,
#                       SEP = 4, SEQ = 2, SER = 4))
#  
#  # Adding a little bit, so the threshold is included.
#  e <- .Machine$double.eps^0.5
#  
#  # Using the default farthest neighbor algorithm to collapse genotypes
#  mlg.filter(monpop, distance = bruvo.dist, replen = reps) <- (0.5/13) + e
#  montabf <- mlg.table(monpop, strata = ~Symptom/Year)

## ---- echo = FALSE-------------------------------------------------------
monpop@mlg <- new("MLG", monpop@mlg)
filts <- c(260L, 179L, 168L, 168L, 167L, 221L, 152L, 133L, 144L, 78L,
78L, 79L, 81L, 44L, 40L, 40L, 40L, 38L, 119L, 120L, 93L, 29L,
10L, 239L, 38L, 93L, 96L, 172L, 114L, 60L, 72L, 82L, 78L, 129L,
138L, 89L, 203L, 120L, 34L, 21L, 21L, 222L, 32L, 104L, 95L, 95L,
203L, 190L, 80L, 95L, 95L, 82L, 82L, 21L, 95L, 95L, 222L, 138L,
51L, 222L, 222L, 222L, 222L, 222L, 104L, 212L, 95L, 222L, 170L,
95L, 251L, 35L, 258L, 151L, 83L, 156L, 25L, 241L, 130L, 210L,
163L, 234L, 196L, 205L, 233L, 159L, 161L, 227L, 216L, 216L, 206L,
161L, 216L, 161L, 161L, 194L, 161L, 47L, 157L, 161L, 70L, 161L,
216L, 161L, 216L, 207L, 204L, 134L, 216L, 204L, 161L, 56L, 136L,
161L, 159L, 216L, 161L, 194L, 161L, 204L, 47L, 227L, 70L, 174L,
161L, 47L, 134L, 70L, 134L, 47L, 216L, 216L, 55L, 70L, 194L,
216L, 161L, 161L, 216L, 216L, 216L, 70L, 216L, 47L, 47L, 110L,
197L, 161L, 42L, 258L, 258L, 235L, 256L, 85L, 18L, 103L, 52L,
14L, 57L, 250L, 213L, 77L, 62L, 195L, 5L, 106L, 53L, 148L, 192L,
112L, 71L, 185L, 19L, 31L, 178L, 153L, 20L, 101L, 96L, 111L,
59L, 54L, 199L, 54L, 99L, 54L, 242L, 212L, 28L, 91L, 65L, 212L,
40L, 175L, 175L, 175L, 184L, 175L, 212L, 176L, 91L, 91L, 122L,
44L, 91L, 91L, 91L, 175L, 91L, 175L, 91L, 28L, 175L, 175L, 65L,
65L, 28L, 63L, 175L, 125L, 91L, 91L, 175L, 126L, 91L, 28L, 91L,
93L, 91L, 91L, 91L, 91L, 27L, 91L, 65L, 91L, 175L, 90L, 184L,
220L, 175L, 175L, 175L, 91L, 91L, 91L, 91L, 65L, 91L, 91L, 93L,
91L, 91L, 91L, 91L, 91L, 28L, 90L, 91L, 222L, 95L, 21L, 95L,
175L, 95L, 95L, 95L, 222L, 122L, 173L, 173L, 222L, 222L, 105L,
222L, 222L, 222L, 222L, 222L, 34L, 222L, 211L, 92L, 80L, 3L,
222L, 92L, 80L, 173L, 222L, 262L, 222L, 261L, 261L, 222L, 95L,
222L, 222L, 222L, 222L, 222L, 222L, 113L, 261L, 73L, 261L, 95L,
261L, 73L, 222L, 172L, 95L, 172L, 80L, 93L, 21L, 95L, 60L, 21L,
21L, 95L, 95L, 95L, 95L, 95L, 95L, 211L, 95L, 80L, 95L, 246L,
211L, 95L, 96L, 95L, 95L, 96L, 124L, 177L, 95L, 222L, 95L, 222L,
82L, 95L, 203L, 120L, 120L, 173L, 222L, 173L, 95L, 173L, 37L,
173L, 124L, 222L, 37L, 173L, 173L, 173L, 173L, 173L, 173L, 173L,
154L, 154L, 173L, 222L, 173L, 95L, 173L, 95L, 222L, 222L, 173L,
120L, 21L, 120L, 120L, 95L, 173L, 173L, 222L, 219L, 104L, 67L,
64L, 67L, 255L, 217L, 255L, 225L, 61L, 258L, 36L, 252L, 181L,
88L, 110L, 50L, 237L, 224L, 33L, 237L, 164L, 110L, 12L, 12L,
68L, 12L, 12L, 25L, 255L, 110L, 76L, 259L, 25L, 164L, 254L, 164L,
258L, 110L, 110L, 25L, 50L, 258L, 110L, 237L, 12L, 68L, 76L,
68L, 12L, 180L, 164L, 76L, 12L, 12L, 255L, 12L, 181L, 251L, 47L,
237L, 67L, 67L, 36L, 237L, 110L, 255L, 255L, 50L, 12L, 47L, 12L,
67L, 237L, 200L, 200L, 68L, 127L, 258L, 237L, 243L, 74L, 187L,
196L, 115L, 209L, 130L, 187L, 187L, 164L, 181L, 100L, 237L, 12L,
196L, 257L, 146L, 140L, 54L, 139L, 242L, 54L, 242L, 87L, 183L,
242L, 149L, 54L, 54L, 59L, 242L, 213L, 2L, 54L, 242L, 139L, 242L,
226L, 59L, 244L, 208L, 242L, 242L, 242L, 242L, 242L, 242L, 22L,
182L, 242L, 242L, 182L, 54L, 87L, 43L, 242L, 242L, 183L, 140L,
140L, 242L, 54L, 199L, 9L, 87L, 242L, 242L, 213L, 242L, 182L,
18L, 18L, 48L, 242L, 242L, 54L, 22L, 191L, 87L, 59L, 242L, 140L,
165L, 19L, 86L, 242L, 242L, 4L, 4L, 54L, 22L, 236L, 54L, 242L,
242L, 242L, 54L, 9L, 96L, 146L, 87L, 87L, 208L, 214L, 18L, 214L,
98L, 189L, 189L, 98L, 98L, 75L, 16L, 189L, 162L, 115L, 110L,
16L, 46L, 110L, 209L, 135L, 25L, 193L, 189L, 84L, 84L, 16L, 245L,
232L, 196L, 196L, 115L, 227L, 115L, 245L, 110L, 110L, 1L, 227L,
196L, 110L, 16L, 187L, 1L, 150L, 196L, 209L, 193L, 16L, 209L,
209L, 193L, 180L, 11L, 196L, 1L, 110L, 16L, 55L, 75L, 115L, 180L,
193L, 1L, 198L, 193L, 110L, 209L, 64L, 110L, 209L, 16L, 209L,
16L, 217L, 209L, 16L, 1L, 189L, 180L, 115L, 110L, 255L, 109L,
16L, 115L, 16L, 115L, 227L, 245L, 110L, 162L, 1L, 189L, 25L,
12L, 187L, 186L, 115L, 115L, 49L, 67L, 209L, 16L, 198L, 110L,
16L, 98L, 127L, 201L, 1L, 16L, 16L, 196L, 74L, 115L, 228L, 1L,
110L, 231L, 110L, 110L, 110L, 215L, 142L, 7L, 218L, 230L, 58L
)
monpop@mlg@mlg$contracted <- filts
mll(monpop) <- "contracted"
montabf <- mlg.table(monpop, strata = ~Symptom/Year)

## ------------------------------------------------------------------------
(monstatf <- diversity_stats(montabf, CF = myCF))
monstat2 - monstatf # Take the difference from the unfiltered

## ------------------------------------------------------------------------
mll(monpop) <- "original"

## ---- message = TRUE-----------------------------------------------------
(monrare <- diversity_ci(montab, n = 100L, rarefy = TRUE, raw = FALSE))

## ------------------------------------------------------------------------
nmll(monpop, "original")
nmll(monpop, "contracted")
mll(monpop) <- "contracted"

## ------------------------------------------------------------------------
monpop %>%
  clonecorrect(strata = NA) %>%  # 1. clone correct whole data set
  dist() %>%                     # 2. calculate distance
  sum()                          # 3. take the sum of the distance

## ------------------------------------------------------------------------
set.seed(999)
monpop[sample(nInd(monpop))] %>% # 1. shuffle samples
  clonecorrect(strata = NA) %>%  # 2. clone correct whole data set
  dist() %>%                     # 3. calculate distance
  sum()                          # 4. take the sum of the distance

set.seed(1000)
monpop[sample(nInd(monpop))] %>% # 1. shuffle samples
  clonecorrect(strata = NA) %>%  # 2. clone correct whole data set
  dist() %>%                     # 3. calculate distance
  sum()                          # 4. take the sum of the distance

