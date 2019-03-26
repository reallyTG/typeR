library(optpart)


### Name: archi
### Title: Archipelago Analysis
### Aliases: archi
### Keywords: cluster

### ** Examples

    data(shoshveg) # produces a vegetation dataframe
    dis.bc <- dsvdis(shoshveg,'bray/curtis') 
        # produces a Bray/Curtis dissimilarity matrix
    arc.50 <- archi(dis.bc,0.5) # clusters at 0.5 dissimilarity 
    table(arc.50$clustering)



