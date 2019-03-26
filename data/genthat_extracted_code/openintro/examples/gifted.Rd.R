library(openintro)


### Name: gifted
### Title: Analytical skills of young gifted children
### Aliases: gifted
### Keywords: datasets, regression

### ** Examples

data(gifted)
histPlot(gifted$count)
histPlot(gifted$fatheriq)
histPlot(gifted$motheriq)
histPlot(gifted$motheriq - gifted$fatheriq)
plot(gifted$score ~ gifted$motheriq)
lm(gifted$score ~ gifted$motheriq + gifted$fatheriq + gifted$speak +
                                    gifted$count + gifted$read + 
                                    gifted$edutv + gifted$cartoons)



