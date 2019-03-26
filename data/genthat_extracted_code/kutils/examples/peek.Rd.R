library(kutils)


### Name: peek
### Title: Show variables, one column at a time.
### Aliases: peek histOMatic

### ** Examples

## No test: 
set.seed(234234)
N <- 200
mydf <- data.frame(x5 = rnorm(N), x4 = rnorm(N), x3 = rnorm(N),
                   x2 = letters[sample(1:24, 200, replace = TRUE)],
                   x1 = factor(sample(c("cindy", "bobby", "marsha",
                                        "greg", "chris"), 200, replace = TRUE)),
                   stringsAsFactors = FALSE)
## Insert 16 missings
mydf$x1[sample(1:150, 16,)] <- NA
mydf$adate <- as.Date(c("1jan1960", "2jan1960", "31mar1960", "30jul1960"), format = "%d%b%y")
peek(mydf, width = 8, height = 5)
dev.off()
peek(mydf, sort = FALSE)
dev.off()
## Demonstrate the dot-dot-dot usage to pass in hist params
peek(mydf, breaks = 30, ylab = "These are Counts, not Densities", freq = TRUE)
dev.off()
## Not Run: file output
## peek(mydf, sort = FALSE, file = "three_histograms.pdf")
## Use some objects from the datasets package
library(datasets)
peek(cars, xlabstub = "R cars data: ")
dev.off()
peek(EuStockMarkets, xlabstub = "Euro Market Data: ")
dev.off()
peek(EuStockMarkets, xlabstub = "Euro Market Data: ", breaks = 50,
     freq = TRUE)
dev.off()
## Not run: file output
## peek(EuStockMarkets, breaks = 50, file = "myeuro.pdf",
##      height = 4, width=3, family = "Times")
## peek(EuStockMarkets, breaks = 50, file = "myeuro-%d3.pdf",
##      onefile = FALSE, family = "Times", textout = TRUE)
## xlab goes into "..." and affects both histograms and barplots
peek(mydf, breaks = 30, ylab = "These are Counts, not Densities",
    freq = TRUE)
dev.off()
## xlab is added in the barargs list.
peek(mydf, breaks = 30, ylab = "These are Counts, not Densities",
    freq = TRUE, barargs = list(horiz = TRUE, las = 1, xlab = "I'm in barargs"))
dev.off()
peek(mydf, breaks = 30, ylab = "These are Counts, not Densities", freq = TRUE,
     barargs = list(horiz = TRUE, las = 1, xlim = c(0, 100),
     xlab = "I'm in barargs, not in histargs"))
levels(mydf$x1) <- c(levels(mydf$x1), "arthur philpot smythe")
mydf$x1[4] <- "arthur philpot smythe"
mydf$x2[1] <- "I forgot what letter"
peek(mydf, breaks = 30,
     barargs = list(horiz = TRUE, las = 1))
dev.off()
## End(No test)



