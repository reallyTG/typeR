library(msos)


### Name: sort_silhouette
### Title: Sort the silhouettes by group
### Aliases: sort_silhouette

### ** Examples


# Uses sports data.
data(sportsranks)

# Obtain the K-means clustering for sports ranks.
kms <- kmeans(sportsranks, centers = 5, nstart = 10)

# Silhouettes
sil <- silhouette.km(sportsranks, kms$centers)
ssil <- sort_silhouette(sil, kms$cluster)




