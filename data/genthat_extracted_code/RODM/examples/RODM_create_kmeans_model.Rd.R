library(RODM)


### Name: RODM_create_kmeans_model
### Title: Create a Hierarchical k-means model
### Aliases: RODM_create_kmeans_model
### Keywords: cluster

### ** Examples

## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid= "rodm", pwd = "rodm")
##D 
##D ### Clustering a 2D multi-Gaussian distribution of points into clusters
##D 
##D set.seed(seed=6218945)
##D X1 <- c(rnorm(100, mean = 2, sd = 1), rnorm(100, mean = 8, sd = 2), rnorm(100, mean = 5, sd = 0.6),
##D         rnorm(100, mean = 4, sd = 1), rnorm(100, mean = 10, sd = 1)) # Create and merge 5 Gaussian distributions
##D Y1 <- c(rnorm(100, mean = 1, sd = 2), rnorm(100, mean = 4, sd = 1.5), rnorm(100, mean = 6, sd = 0.5),
##D         rnorm(100, mean = 3, sd = 0.2), rnorm(100, mean = 2, sd = 1))
##D ds <- data.frame(cbind(X1, Y1)) 
##D n.rows <- length(ds[,1])                                                    # Number of rows
##D row.id <- matrix(seq(1, n.rows), nrow=n.rows, ncol=1, dimnames= list(NULL, c("ROW_ID"))) # Row id
##D ds <- cbind(row.id, ds)                                                     # Add row id to dataset 
##D RODM_create_dbms_table(DB, "ds")   
##D 
##D km <- RODM_create_kmeans_model(
##D    database = DB,                  # database ODBC channel identifier
##D    data_table_name = "ds",         # data frame containing the input dataset
##D    case_id_column_name = "ROW_ID", # case id to enable assignments during build
##D    num_clusters = 5)
##D 
##D km2 <- RODM_apply_model(
##D    database = DB,                  # database ODBC channel identifier
##D    data_table_name = "ds",         # data frame containing the input dataset
##D    model_name = "KM_MODEL",
##D    supplemental_cols = c("X1","Y1"))
##D 
##D x1a <- km2$model.apply.results[, "X1"]
##D y1a <- km2$model.apply.results[, "Y1"]
##D clu <- km2$model.apply.results[, "CLUSTER_ID"]
##D c.numbers <- unique(as.numeric(clu))
##D c.assign <- match(clu, c.numbers)
##D color.map <- c("blue", "green", "red", "orange", "purple")
##D color <- color.map[c.assign]
##D nf <- layout(matrix(c(1, 2), 1, 2, byrow=T), widths = c(1, 1), heights = 1, respect = FALSE)
##D plot(x1a, y1a, pch=20, col=1, xlab="X1", ylab="Y1", main="Original Data Points")
##D plot(x1a, y1a, pch=20, type = "n", xlab="X1", ylab="Y1", main="After kmeans clustering")
##D for (i in 1:n.rows) {
##D    points(x1a[i], y1a[i], col= color[i], pch=20)
##D }   
##D legend(5, -0.5, legend=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5"), pch = rep(20, 5), 
##D        col = color.map, pt.bg = color.map, cex = 0.8, pt.cex=1, bty="n")
##D 
##D km        # look at the model details and cluster assignments
##D 
##D RODM_drop_model(DB, "KM_MODEL")   # Drop the model
##D RODM_drop_dbms_table(DB, "ds")    # Drop the database table
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



