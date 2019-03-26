library(vcdExtra)


### Name: Yamaguchi87
### Title: Occupational Mobility in Three Countries
### Aliases: Yamaguchi87
### Keywords: datasets

### ** Examples

data(Yamaguchi87)
# reproduce Table 1
structable(~ Father + Son + Country, Yamaguchi87)
# create table form
Yama.tab <- xtabs(Freq ~ Son + Father + Country, data=Yamaguchi87)

# define mosaic labeling_args for convenient reuse in 3-way displays
largs <- list(rot_labels=c(right=0), offset_varnames = c(right = 0.6), 
              offset_labels = c(right = 0.2),
              set_varnames = c(Son="Son's status", Father="Father's status") 
             )

###################################
# Fit some models & display mosaics
  
# Mutual independence
yama.indep <- glm(Freq ~ Son + Father + Country, data=Yamaguchi87, family=poisson)
anova(yama.indep)

mosaic(yama.indep, ~Son+Father, main="[S][F] ignoring country")
mosaic(yama.indep, ~Country + Son + Father, condvars="Country",
       labeling_args=largs, 
       main='[S][F][C] Mutual independence') 

# no association between S and F given country ('perfect mobility')
# asserts same associations for all countries
yama.noRC <- glm(Freq ~ (Son + Father) * Country, data=Yamaguchi87, family=poisson)
anova(yama.noRC)
mosaic(yama.noRC, ~~Country + Son + Father, condvars="Country", 
       labeling_args=largs, 
       main="[SC][FC] No [SF] (perfect mobility)")

# ignore diagonal cells
yama.quasi <- update(yama.noRC, ~ . + Diag(Son,Father):Country)
anova(yama.quasi)
mosaic(yama.quasi, ~Son+Father, main="Quasi [S][F]")

## see also:
# demo(yamaguchi-xie)
##



