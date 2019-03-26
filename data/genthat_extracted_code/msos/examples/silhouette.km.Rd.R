library(msos)


### Name: silhouette.km
### Title: Silhouettes for K-Means Clustering
### Aliases: silhouette.km

### ** Examples


# Uses sports data.
data(sportsranks)

# Obtain the K-means clustering for sports ranks.
kms <- kmeans(sportsranks, centers = 5, nstart = 10)

# Silhouettes
sil <- silhouette.km(sportsranks, kms$centers)




