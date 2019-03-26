library(openintro)


### Name: textbooks
### Title: Textbook data for UCLA Bookstore and Amazon
### Aliases: textbooks
### Keywords: datasets

### ** Examples

data(textbooks)
#===> an improper analysis <===#
boxPlot(textbooks$uclaNew, xlim=c(0.5,2.5))
boxPlot(textbooks$amazNew, add=2)
axis(1, at=1:2, labels=c('UCLA Bookstore', 'Amazon'))
t.test(textbooks$uclaNew, textbooks$amazNew)

#===> a reasonable analysis <===#
#     the differences are moderately skewed
#     the sample size is sufficiently large to justify t test
histPlot(textbooks$diff)
t.test(textbooks$diff)



