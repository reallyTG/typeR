library(clues)


### Name: compClust
### Title: Compare different partitions for a data set
### Aliases: compClust
### Keywords: cluster

### ** Examples


    # Maronna data set
    data(Maronna)
    # data matrix
    maronna <- Maronna$maronna
    # cluster membership
    maronna.mem <- Maronna$maronna.mem    

    # partition by clues and kmeans
    res_CH <- clues(maronna, strengthMethod = "CH", quiet = TRUE)
    res_sil <- clues(maronna, strengthMethod = "sil", quiet = TRUE)
    res_km_HW <- kmeans(maronna, 4, algorithm = "Hartigan-Wong")
    res_km_L <- kmeans(maronna, 4, algorithm = "Lloyd")
    res_km_F <- kmeans(maronna, 4, algorithm = "Forgy")
    res_km_M <- kmeans(maronna, 4, algorithm = "MacQueen")
 
    memMat <- cbind(maronna.mem, res_CH$mem, res_sil$mem, 
        res_km_HW$cluster, res_km_L$cluster, 
        res_km_F$cluster, res_km_M$cluster) 
 
    colnames(memMat) <- c("true", "clues_CH", "clues_sil", 
        "km_HW", "km_L", "km_F", "km_M")
 
    res <- compClust(maronna, memMat)

    print(sapply(res, function(x) {round(x,1)}))




