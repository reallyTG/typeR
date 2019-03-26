context('df2table')

# Roundtrip test of data.frame
df <- data.frame(ID=c(1, 2), DV=c(3, 4))
attributes(df)$columnType <- list(c("id"), c("dv"))

res <- so_Residuals$new()
res$ResidualTable <- df

new_res <- res$ResidualTable

expect_identical(new_res, df)