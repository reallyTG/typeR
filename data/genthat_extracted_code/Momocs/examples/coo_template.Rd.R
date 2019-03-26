library(Momocs)


### Name: coo_template
### Title: 'Templates' shapes
### Aliases: coo_template coo_template coo_template.default coo_template
###   coo_template.list coo_template coo_template.Coo coo_template
###   coo_template_relatively coo_template coo_template_relatively.list
###   coo_template coo_template_relatively.Coo

### ** Examples


coo <- bot[1]
coo_plot(coo_template(coo), xlim=c(-1, 1), ylim=c(-1, 1))
rect(-0.5, -0.5, 0.5, 0.5)

s <- 0.01
coo_plot(coo_template(coo, s))
rect(-s/2, -s/2, s/2, s/2)



