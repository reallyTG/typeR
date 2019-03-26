library(genetics)


### Name: groupGenotype
### Title: Group genotype values
### Aliases: groupGenotype
### Keywords: manip misc

### ** Examples


## --- Setup ---

x <- c("A/A", "A/B", "B/A", "A/C", "C/A", "A/D", "D/A",
       "B/B", "B/C", "C/B", "B/D", "D/B",
       "C/C", "C/D", "D/C",
       "D/D")
g <- genotype(x, reorder="yes")
## "A/A" "A/B" "A/B" "A/C" "A/C" "A/D" "A/D" "B/B" "B/C" "B/C" "B/D" "B/D"
## "C/C" "C/D" "C/D" "D/D"

h <- haplotype(x)
## "A/A" "A/B" "B/A" "A/C" "C/A" "A/D" "D/A" "B/B" "B/C" "C/B" "B/D" "D/B"
## "C/C" "C/D" "D/C" "D/D"

## --- Use of "A/A", "A/*" and ".else" ---

map <- list("homoG"=c("A/A", "B/B", "C/C", "D/D"),
            "heteroA*"=c("A/B", "A/C", "A/D"),
            "heteroB*"=c("B/*"),
            "heteroRest"=".else")

(tmpG <- groupGenotype(x=g, map=map, factor=FALSE))
(tmpH <- groupGenotype(x=h, map=map, factor=FALSE, haplotype=TRUE))

## Show difference between genotype and haplotype treatment
cbind(as.character(h), gen=tmpG, hap=tmpH, diff=!(tmpG == tmpH))
##              gen          hap          diff
##  [1,] "A/A" "homoG"      "homoG"      "FALSE"
##  [2,] "A/B" "heteroA*"   "heteroA*"   "FALSE"
##  [3,] "B/A" "heteroA*"   "heteroB*"   "TRUE"
##  [4,] "A/C" "heteroA*"   "heteroA*"   "FALSE"
##  [5,] "C/A" "heteroA*"   "heteroRest" "TRUE"
##  [6,] "A/D" "heteroA*"   "heteroA*"   "FALSE"
##  [7,] "D/A" "heteroA*"   "heteroRest" "TRUE"
##  [8,] "B/B" "homoG"      "homoG"      "FALSE"
##  [9,] "B/C" "heteroB*"   "heteroB*"   "FALSE"
## [10,] "C/B" "heteroB*"   "heteroRest" "TRUE"
## [11,] "B/D" "heteroB*"   "heteroB*"   "FALSE"
## [12,] "D/B" "heteroB*"   "heteroRest" "TRUE"
## [13,] "C/C" "homoG"      "homoG"      "FALSE"
## [14,] "C/D" "heteroRest" "heteroRest" "FALSE"
## [15,] "D/C" "heteroRest" "heteroRest" "FALSE"
## [16,] "D/D" "homoG"      "homoG"      "FALSE"

map <- list("withA"="A/*", "rest"=".else")
groupGenotype(x=g, map=map, factor=FALSE)
##  [1] "withA" "withA" "withA" "withA" "withA" "withA" "withA" "rest"  "rest"
## [10] "rest"  "rest"  "rest"  "rest"  "rest"  "rest"  "rest"

groupGenotype(x=h, map=map, factor=FALSE, haplotype=TRUE)
##  [1] "withA" "withA" "rest"  "withA" "rest"  "withA" "rest"  "rest"  "rest"
## [10] "rest"  "rest"  "rest"  "rest"  "rest"  "rest"  "rest"

## --- Use of "*/*" ---

map <- list("withA"="A/*", withB="*/*")
groupGenotype(x=g, map=map, factor=FALSE)
##  [1] "withA" "withA" "withA" "withA" "withA" "withA" "withA" "withB" "withB"
## [10] "withB" "withB" "withB" "withB" "withB" "withB" "withB"

## --- Missing genotype specifications produces NA's ---

map <- list("withA"="A/*", withB="B/*")
groupGenotype(x=g, map=map, factor=FALSE)
##  [1] "withA" "withA" "withA" "withA" "withA" "withA" "withA" "withB" "withB"
## [10] "withB" "withB" "withB" NA      NA      NA      NA

groupGenotype(x=h, map=map, factor=FALSE, haplotype=TRUE)
##  [1] "withA" "withA" "withB" "withA" NA      "withA" NA      "withB" "withB"
## [10] NA      "withB" NA      NA      NA      NA      NA




