stopifnot(require("fortunes"), require("utils"), getRversion() >= "3.2.1")
sessionInfo()
packageDescription("fortunes")

### fortunes 1.5-3 contained "invalid multibyte string

FD <- read.fortunes()
## Plausibility of correct fortunes.data :
stopifnot(is.data.frame(FD), (nF <- nrow(FD)) > 370)
str(FD)

fortune("f.o.o.*b.a.r") # should give empty but
## gave an error
## Error in tolower(fort) : invalid multibyte string 364

## Check that *printing* works {also failed at '364' above}:
allOut <- lapply(seq_len(nF), function(i) capture.output(fortune(i)))
## Error in if (nchar(line) < width) return(line) (from #1) :
##   missing value where TRUE/FALSE needed
## In addition: Warning message:
## In strsplit(line1, "<x>") : input string 1 is invalid in this locale

stopifnot(unique(vapply(allOut, class, "")) == "character", length(allOut) == nF)

## lines of output
nlFort <- lengths(allOut)
## character of output
ncFort <- sapply(allOut, nchar, type="bytes")

## output:
stopifnot(vapply(ncFort, `[[`, -1, 1L) == 0, # empty (0 char) line at beginning
          all.equal(lengths(ncFort), nlFort))

table(nlFort)
plot(table(nlFort),
  main = paste("fortune(n): #{lines of output},  n = 1..", nF, sep = ""),
  xlab = "#{lines}")
abline(h = 0, col = "gray")

tAut <- table(FD[, "author"])
sort(tAut, decreasing = TRUE)
## "TODO": a version where multi-authors are split (with weights 1/k for group of k)

plot(table(tAut), main = paste("#{fortunes per \"author\"}", sep = ""))
abline(h = 0, col = "gray")
