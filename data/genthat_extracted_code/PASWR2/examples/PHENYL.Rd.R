library(PASWR2)


### Name: PHENYL
### Title: Phenylketonuria
### Aliases: PHENYL
### Keywords: datasets

### ** Examples

PL <- stack(PHENYL)
PL$sub <- factor(rep(1:46, 4))
ggplot(data = PL, aes(x= ind, y = values, group = sub, color = sub)) + geom_line() + 
guides(color = FALSE)
with(data = PHENYL,
t.test(Q10.1, conf.level = 0.99))



