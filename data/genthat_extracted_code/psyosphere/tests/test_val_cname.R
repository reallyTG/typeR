
# Prepare test
cat("\nTesting val_cname()\n")
rm(list = ls(all.names = TRUE))
data(psyo)

# Test t_id
t1 <- psyo
t_id <- "id"
e <- val_cname(t1, t_id, size = 15, type = "character"); if (e != "") {stop(e)}

# Be aware that id column is saved as "factor" and therefore mode() returns
# numeric.

# Uncomment the following tests to make them work
# t2 <- psyo
# t_id <- 1
# e <- val_cname(t2, t_id); if (e != "") {stop(e)}

# t3 <- psyo
# t_id <- "id"
# e <- val_cname(t3, t_id, size = 15, type = "character"); if (e != "") {stop(e)}

# t4 <- psyo
# t_id <- "id"
# e <- val_cname(t4, t_id, size = 20); if (e != "") {stop(e)}

# t5 <- psyo
# t_id <- "id"
# e <- val_cname(t5, t_id, size = "20"); if (e != "") {stop(e)}

# Simple example of two cnames -------------------------------------------------

a <- c(F, F, F)
b <- c(T, T, F)
df <- data.frame(a,b)
e <- val_cname(df, c("a","b"), type = "logical"); if (e != "") {stop(e)}
