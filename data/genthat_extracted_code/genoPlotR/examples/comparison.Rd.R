library(genoPlotR)


### Name: comparison
### Title: Comparison class and class functions
### Aliases: comparison as.comparison is.comparison
### Keywords: data

### ** Examples

## Get some values
starts1 <- c(2, 1000, 1050)
ends1 <- c(600, 800, 1345)
starts2 <- c(50, 800, 1200)
ends2 <- c(900, 1100, 1322)

## From a data.frame
comparison1 <- as.comparison(data.frame(start1=starts1, end1=ends1,
                                        start2=starts2, end2=ends2))
comparison1
is.comparison(comparison1)
is.data.frame(comparison1)
comparison(data.frame(start1=starts1, end1=ends1,
                      start2=starts2, end2=ends2))
## From a list
comparison(list(start1=starts1, end1=ends1,
                start2=starts2, end2=ends2))

## From a file
comparison2_file <- system.file('extdata/comparison2.tab',
                                package = 'genoPlotR')
comparison2 <- read_comparison_from_tab(comparison2_file)




