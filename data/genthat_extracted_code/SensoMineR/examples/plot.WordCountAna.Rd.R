library(SensoMineR)


### Name: plot.WordCountAna
### Title: Word-Count based methods Analysis (WordCountAna) graphs
### Aliases: plot.WordCountAna
### Keywords: multivariate

### ** Examples

data(perfume)
res<-WordCountAna(base=perfume,sep.word=";",graph=FALSE)
plot.WordCountAna(res,choix="prod")
plot.WordCountAna(res,choix="panel")
plot.WordCountAna(res,choix="dist")
plot.WordCountAna(res,choix="cons")
plot.WordCountAna(res,choix="cons",proba=0.1)



