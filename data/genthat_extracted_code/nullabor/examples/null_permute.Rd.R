library(nullabor)


### Name: null_permute
### Title: Generate null data by permuting a variable.
### Aliases: null_permute

### ** Examples

data(mtcars)
library(ggplot2)
ggplot(data=rorschach(method=null_permute("mpg"), n = 3, true=mtcars)) +
geom_boxplot(aes(x=factor(cyl), y=mpg, fill=factor(cyl))) +facet_grid(.~.sample) +
theme(legend.position="none", aspect.ratio=1)



