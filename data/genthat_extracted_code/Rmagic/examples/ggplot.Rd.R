library(Rmagic)


### Name: ggplot.magic
### Title: Convert a MAGIC object to a data.frame for ggplot
### Aliases: ggplot.magic

### ** Examples

if (reticulate::py_module_available("magic") && require(ggplot2)) {

data(magic_testdata)
data_magic <- magic(magic_testdata, genes=c("VIM", "CDH1", "ZEB1"))
ggplot(data_magic, aes(VIM, CDH1, colour=ZEB1)) +
  geom_point()

}



