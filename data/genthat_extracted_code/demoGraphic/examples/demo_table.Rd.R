library(demoGraphic)


### Name: demo_table
### Title: Demographic Table for continuous and categorical variables
### Aliases: demo_table

### ** Examples

set.seed(2018)
group <-round(abs(rnorm(500)*10),0) %% 2
cont_1 <-round(abs(rnorm(500)*10),0)
cat_multi_1 <-round(abs(rnorm(500)*10),0) %% 3
data_check <-data.frame(group, cont_1, cat_multi_1)
data_check$group <- factor(data_check$group, levels = c(0,1), labels = c("Control","Treatment"))
data_check$cat_multi_1 <- factor(data_check$cat_multi_1)
demo_table(c("cont_1","cat_multi_1"),"group", data_check )



