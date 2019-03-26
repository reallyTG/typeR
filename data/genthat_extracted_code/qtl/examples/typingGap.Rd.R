library(qtl)


### Name: typingGap
### Title: Maximum distance between genotyped markers
### Aliases: typingGap
### Keywords: utilities

### ** Examples

data(hyper)
plot(typingGap(hyper, chr=5), 
     ylab="Maximum gap between typed markers (cM)",
     ylim=c(0, diff(range(pull.map(hyper,chr=5)[[1]]))))

plot(typingGap(hyper, chr=4), 
     ylab="Maximum gap between typed markers (cM)",
     ylim=c(0, diff(range(pull.map(hyper,chr=4)[[1]]))))

plot(typingGap(hyper, chr=4, terminal=TRUE),
     ylab="Maximum gap between chr end and typed marker (cM)",
     ylim=c(0, diff(range(pull.map(hyper,chr=4)[[1]]))))



