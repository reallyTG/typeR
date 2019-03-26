library(OPDOE)


### Name: size.anova
### Title: Design of Experiments for ANOVA
### Aliases: size.anova
### Keywords: anova

### ** Examples

size.anova(model="a",a=4,
      alpha=0.05,beta=0.1, delta=2, case="maximin")
size.anova(model="a",a=4,
      alpha=0.05,beta=0.1, delta=2, case="minimin")

size.anova(model="axb", hypothesis="a", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="maximin")
size.anova(model="axb", hypothesis="a", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="maximin")

size.anova(model="axb", hypothesis="axb", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="minimin")
size.anova(model="axb", hypothesis="axb", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="minimin")

size.anova(model="axBxC",hypothesis="a",
           assumption="sigma_AC=0,b=c",a=6,n=2,
           alpha=0.05, beta=0.1, delta=0.5, cases="maximin")
size.anova(model="axBxC",hypothesis="a",
           assumption="sigma_AC=0,b=c",a=6,n=2,
           alpha=0.05, beta=0.1, delta=0.5, cases="minimin")

size.anova(model="a>B>c", hypothesis="c",a=6, b=2, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="a>B>c", hypothesis="c",a=6, b=20, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")

size.anova(model="a>B>c", hypothesis="c",a=6, b=NA, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")

size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="minimin")

size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="minimin")



