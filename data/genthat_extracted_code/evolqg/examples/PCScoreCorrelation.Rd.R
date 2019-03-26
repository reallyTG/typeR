library(evolqg)


### Name: PCScoreCorrelation
### Title: PC Score Correlation Test
### Aliases: PCScoreCorrelation

### ** Examples

#Input can be an array with means in each row or a list of mean vectors
means = array(rnorm(40*10), c(10, 40)) 
cov.matrix = RandomMatrix(40, 1, 1, 10)
taxons = LETTERS[1:10]
PCScoreCorrelation(means, cov.matrix, taxons)

##Plots list can be displayed using grid.arrange()
#library(gridExtra)
#pc.score.output <- PCScoreCorrelation(means, cov.matrix, taxons, TRUE)
#do.call(grid.arrange, c(pc.score.output$plots,list(nrow=4,ncol=6)))
##Or we can print to file:
#ggsave("multipage.pdf", do.call(marrangeGrob, c(pc.score.output$plots, list(nrow=2, ncol=2))))



