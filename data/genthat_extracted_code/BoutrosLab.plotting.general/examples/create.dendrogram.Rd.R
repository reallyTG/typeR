library(BoutrosLab.plotting.general)


### Name: create.dendrogram
### Title: Generate a dendrogram
### Aliases: create.dendrogram
### Keywords: cluster

### ** Examples

# create temp data
x <- outer(-5:5, -5:5, '*') + matrix(nrow = 11, ncol = 11, data = runif(11 * 11));
colnames(x) <- paste('col', 1:11, sep = '-');
rownames(x) <- paste('row', 1:11, sep = '-');

# example of generating a column-wise dendrogram using default values
create.dendrogram(
    x = x
    );

# example of generating a column-wise dendrogram using different distance and clustering methods
create.dendrogram(
    x = x,
    clustering.method = 'median',
    cluster.dimension = 'cols',
    distance.method = 'euclidean'
    );

# generate row-wise dendrogram using default distance and clustering methods
create.dendrogram(
    x = x,
    cluster.dimension = 'row'
    );

# generate row-wise dendrogram using different distance and clustering methods
create.dendrogram(
    x = x,
    clustering.method = 'ward',
    cluster.dimension = 'rows',
    distance.method = 'manhattan'
    );



