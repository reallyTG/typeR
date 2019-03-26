library(ProfessR)


### Name: getlet
### Title: Get Letter Grades
### Aliases: getlet getlet2
### Keywords: misc

### ** Examples


g = rnorm(130, m=82, sd=10)

g[g>100] = 100
g[g<1] = 1



B = boxplot(g)


divs = c(min(g), B$stats[1:4] + diff(B$stats)/2, max(g) )

G = getlet(g, divs)

cbind(G$LETS, G$SCRS)



data.frame(G$grades, G$lett, G$scor)






