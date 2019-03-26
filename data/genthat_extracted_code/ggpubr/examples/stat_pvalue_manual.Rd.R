library(ggpubr)


### Name: stat_pvalue_manual
### Title: Add Manually P-values to a ggplot
### Aliases: stat_pvalue_manual

### ** Examples


# T-test
stat.test <- compare_means(
 len ~ dose, data = ToothGrowth,
 method = "t.test"
)
stat.test

# Create a simple box plot
p <- ggboxplot(ToothGrowth, x = "dose", y = "len")
p

# Perform a t-test between groups
stat.test <- compare_means(
 len ~ dose, data = ToothGrowth,
 method = "t.test"
)
stat.test

# Add manually p-values from stat.test data
# First specify the y.position of each comparison
stat.test <- stat.test %>%
 mutate(y.position = c(29, 35, 39))
p + stat_pvalue_manual(stat.test, label = "p.adj")

# Customize the label with glue expression
# (https://github.com/tidyverse/glue)
p + stat_pvalue_manual(stat.test, label = "p = {p.adj}")




