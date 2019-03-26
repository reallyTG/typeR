library(optpart)


### Name: clique
### Title: Maximal Clique Analysis
### Aliases: clique plot.clique summary.clique
### Keywords: cluster

### ** Examples

    data(shoshveg) # produces a vegetation dataframe
    dis.bc <- dsvdis(shoshveg,'bray/curtis') 
          # produces a Bray/Curtis dissimilarity matrix
    cli.50 <- clique(dis.bc,0.5) # clusters at 0.5 dissimilarity, likely to run for
          # a few seconds in most PCs
    summary(cli.50)



