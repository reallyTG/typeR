library(ggformula)


### Name: gf_qq
### Title: Formula interface to geom_qq()
### Aliases: gf_qq gf_qqline gf_qqstep

### ** Examples

gf_qq( ~ rnorm(100))
gf_qq( ~ Sepal.Length | Species, data = iris) %>% gf_qqline()
gf_qq( ~ Sepal.Length | Species, data = iris) %>% gf_qqline(tail = 0.10)
gf_qq( ~ Sepal.Length, color = ~ Species, data = iris) %>%
gf_qqstep( ~ Sepal.Length, color = ~ Species, data = iris)



