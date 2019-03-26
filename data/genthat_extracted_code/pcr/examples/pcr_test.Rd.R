library(pcr)


### Name: pcr_test
### Title: Statistical testing of PCR data
### Aliases: pcr_test

### ** Examples

# locate and read data
fl <- system.file('extdata', 'ct4.csv', package = 'pcr')
ct4 <- readr::read_csv(fl)

# make group variable
group <- rep(c('control', 'treatment'), each = 12)

# test using t-test
pcr_test(ct4,
         group_var = group,
         reference_gene = 'ref',
         reference_group = 'control',
         test = 't.test')

# test using wilcox.test
pcr_test(ct4,
         group_var = group,
         reference_gene = 'ref',
         reference_group = 'control',
         test = 'wilcox.test')

# testing using lm
pcr_test(ct4,
         group_var = group,
         reference_gene = 'ref',
         reference_group = 'control',
         test = 'lm')

# testing advanced designs using a model matrix
# make a model matrix
group <- relevel(factor(group), ref = 'control')
dose <- rep(c(100, 80, 60, 40), each = 3, times = 2)
mm <- model.matrix(~group:dose, data = data.frame(group, dose))

# test using lm
pcr_test(ct4,
         reference_gene = 'ref',
         model_matrix = mm,
         test = 'lm')

# using linear models to check the effect of RNA quality
# make a model matrix
group <- relevel(factor(group), ref = 'control')
set.seed(1234)
quality <- scale(rnorm(n = 24, mean = 1.9, sd = .1))
mm <- model.matrix(~group + group:quality, data = data.frame(group, quality))

# testing using lm
pcr_test(ct4,
         reference_gene = 'ref',
         model_matrix = mm,
         test = 'lm')

# using linear model to check the effects of mixing separate runs
# make a model matrix
group <- relevel(factor(group), ref = 'control')
run <- factor(rep(c(1:3), 8))
mm <- model.matrix(~group + group:run, data = data.frame(group, run))

# test using lm
pcr_test(ct4,
         reference_gene = 'ref',
         model_matrix = mm,
         test = 'lm')




