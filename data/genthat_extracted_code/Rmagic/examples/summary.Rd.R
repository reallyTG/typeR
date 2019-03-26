library(Rmagic)


### Name: summary.magic
### Title: Summarize a MAGIC object
### Aliases: summary.magic

### ** Examples

if (reticulate::py_module_available("magic")) {

data(magic_testdata)
data_magic <- magic(magic_testdata)
summary(data_magic)
## ZEB1
## Min.   :0.01071
## 1st Qu.:0.01119
## Median :0.01130
## Mean   :0.01129
## 3rd Qu.:0.01140
## Max.   :0.01201

}



