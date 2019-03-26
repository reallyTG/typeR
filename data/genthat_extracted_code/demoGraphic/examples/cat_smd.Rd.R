library(demoGraphic)


### Name: cat_smd
### Title: smd value for categorical variables
### Aliases: cat_smd

### ** Examples

set.seed(2018)
group <-round(abs(rnorm(500)*10),0) %% 2
cont_1 <-round(abs(rnorm(500)*10),0)
cat_multi_1 <-round(abs(rnorm(500)*10),0) %% 3
data_check <-data.frame(group, cont_1, cat_multi_1)
data_check$group <- factor(data_check$group, levels = c(0,1), labels = c("Control","Treatment"))
data_check$cat_multi_1 <- factor(data_check$cat_multi_1)
cat_smd(table(data_check$cat_multi_1, data_check$group),"cat_multi_1",data_check )



