library(permubiome)


### Name: permutation
### Title: Permutation-based non-parametric analysis to infer differential
###   abundance of features between groups.
### Aliases: permutation
### Keywords: permutation multiple testing

### ** Examples

## The function is currently defined as
function (nperm = 1000, write.output = TRUE) 
{
    Class <- NULL
    load("permubiome.RData")
    df_norm <- df_norm
    selected_features <- selected_features
    tags.in <- selected_features[, 1]
    tags.out <- setdiff(colnames(df_norm[3:ncol(df_norm)]), tags.in)
    for (a in ncol(df_norm):3) {
        if ((colnames(df_norm[a]) %in% tags.out)) {
            df_norm[, a] <- NULL
        }
    }
    classes <- levels(df_norm$Class)
    if (REFERENCE == "") {
        REFERENCE <- classes[1]
    }
    else if (REFERENCE == classes[2]) {
        classes[2] <- classes[1]
        classes[1] <- REFERENCE
    }
    df_norm$Class <- factor(df$Class, levels = (c(classes[1], 
        classes[2])))
    group1 <- subset(df_norm, Class == classes[1])
    group2 <- subset(df_norm, Class == classes[2])
    categories <- colnames(df_norm)
    size1 <- nrow(group1)
    size2 <- nrow(group2)
    size <- size1 + size2
    pvalue_matrix <- matrix(, nrow = ncol(df_norm) - 2, ncol = 5, 
        byrow = T)
    colnames(pvalue_matrix) <- c("Category", paste("Median ", 
        classes[1], sep = ""), paste("Median ", classes[2], sep = ""), 
        "p.value", "p.adj (fdr)")
    print(paste("Permutation test in progress - This can take some seconds or minutes!"))
    for (i in 3:(ncol(df_norm))) {
        category <- categories[i]
        diff <- median(group1[, i]) - median(group2[, i])
        x <- c(group1[, i], group2[, i])
        y <- array(, nperm)
        for (j in 1:nperm) {
            set <- sample(size, size2, replace = FALSE)
            diff_iter <- median(x[set]) - median(x[-set])
            y[j] <- diff_iter
            ref_score <- (diff - mean(y))/sd(y)
        }
        if (ref_score >= 0) {
            pvalue.i <- pnorm(ref_score, lower.tail = F)
        }
        else {
            pvalue.i <- pnorm(ref_score)
        }
        if (pvalue.i != 0) {
            pvalue_matrix[(i - 2), 1] <- category
        }
        if (pvalue.i != 0) {
            pvalue_matrix[(i - 2), 2] <- round(median(group1[, 
                i]), digits = 0)
        }
        if (pvalue.i != 0) {
            pvalue_matrix[(i - 2), 3] <- round(median(group2[, 
                i]), digits = 0)
        }
        if (pvalue.i != 0) {
            pvalue_matrix[(i - 2), 4] <- format((pvalue.i * 2), 
                digits = 7, scientific = F)
        }
        else {
            pvalue_matrix[(i - 2), 2] <- 1
        }
        pb = txtProgressBar(min = 0, max = (ncol(df_norm) - 2), 
            initial = 0, style = 3)
        setTxtProgressBar(pb, (i - 2))
        invisible()
    }
    pvalue_matrix <- pvalue_matrix[order(pvalue_matrix[, 4]), 
        ]
    pvalue_matrix[, 5] <- format(p.adjust(as.numeric(pvalue_matrix[, 
        4], n = nrow(pvalue_matrix), method = "fdr")), digits = 7, 
        scientific = F)
    cat("\n")
    if (write.output == TRUE) {
        all <- readline("Do you want to include all fetures in the output? (yes/no) : ")
        if (substr(all, 1, 1) == "n") {
            select <- as.numeric(readline("Level of significance to output features (i.e. 0.2) : "))
            significant <- subset(pvalue_matrix, pvalue_matrix[, 
                5] <= select)
        }
        else {
            significant <- pvalue_matrix
        }
        write.table(significant, file = "permutation.output", 
            quote = F, row.names = F, sep = "\t")
        print(paste("Permutation test done and output table printed!"))
    }
    else {
        significant <- pvalue_matrix
        significant
        print(paste("Permutation test done!"))
    }
    save(df, df_norm, REFERENCE, classes, selected_features, 
        nperm, tags.in, tags.out, pvalue_matrix, file = "permubiome.RData")
  }



