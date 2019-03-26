library(apa)


### Name: t_apa
### Title: Report t-Test in APA style
### Aliases: t_apa

### ** Examples

# Two independent samples t-test
t_apa(t_test(1:10, y = c(7:20)))

# Two dependent samples t-test
t_apa(t_test(extra ~ group, sleep, paired = TRUE))




