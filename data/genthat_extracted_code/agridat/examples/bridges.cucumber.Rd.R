library(agridat)


### Name: bridges.cucumber
### Title: Multi-environment trial of cucumbers in a latin square design
### Aliases: bridges.cucumber

### ** Examples


data(bridges.cucumber)
dat <- bridges.cucumber
dat <- transform(dat, rowf=factor(row), colf=factor(col))

if(require(desplot)){
  desplot(yield~col*row|loc, data=dat,
          # aspect unknown
          text=gen, cex=1,
          main="bridges.cucumber")
}

# ----------------------------------------------------------------------------

## Not run: 
##D   # Graphical inference test for heterogenous variances
##D   require(nullabor)
##D   # Create a lineup of datasets
##D   fun <- null_permute("loc")
##D   dat20 <- lineup(fun, dat, n=20, pos=9)
##D   
##D   # Now plot
##D   library(lattice)
##D   bwplot(yield ~ loc|factor(.sample), dat20,
##D          main="bridges.cucumber - graphical inference")
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   ## Random row/col/resid. Same as Bridges 1989, p. 147
##D   m1 <- asreml(yield ~ 1 + gen + loc + loc:gen,
##D                random = ~ rowf:loc + colf:loc, data=dat)
##D 
##D   require(lucid)
##D   vc(m1)
##D   ##             effect component std.error z.ratio constr
##D   ##  rowf:loc!rowf.var     31.62     23.02     1.4    pos
##D   ##  colf:loc!colf.var     18.08     15.32     1.2    pos
##D   ##         R!variance     31.48     12.85     2.4    pos
##D   
##D   ## Random row/col/resid at each loc. Matches p. 147
##D   m2 <- asreml(yield ~ 1 + gen + loc + loc:gen,
##D                random = ~ at(loc):rowf + at(loc):colf, data=dat,
##D                rcov = ~at(loc):units)
##D   vc(m2)
##D   ##                          effect component std.error z.ratio constr
##D   ##  at(loc, Clemson):rowf!rowf.var     32.32    36.58     0.88    pos
##D   ##   at(loc, Tifton):rowf!rowf.var     30.92    28.63     1.1     pos
##D   ##  at(loc, Clemson):colf!colf.var     22.55    28.78     0.78    pos
##D   ##   at(loc, Tifton):colf!colf.var     13.62    14.59     0.93    pos
##D   ##            loc_Clemson!variance     46.85    27.05     1.7     pos
##D   ##             loc_Tifton!variance     16.11     9.299    1.7     pos
##D   
##D   predict(m2, data=dat, classify='loc:gen')$predictions$pvals
##D   ##     loc      gen Predicted Std Err    Status
##D   ## Clemson   Dasher     45.55   5.043 Estimable
##D   ## Clemson Guardian     31.62   5.043 Estimable
##D   ## Clemson Poinsett     21.42   5.043 Estimable
##D   ## Clemson   Sprint     25.95   5.043 Estimable
##D   ##  Tifton   Dasher     50.48   3.894 Estimable
##D   ##  Tifton Guardian     38.72   3.894 Estimable
##D   ##  Tifton Poinsett     33.01   3.894 Estimable
##D   ##  Tifton   Sprint     39.18   3.894 Estimable
##D 
##D   # Is a heterogeneous model justified? Maybe not.
##D   m1$loglik
##D   ## -67.35585
##D   m2$loglik
##D   ## -66.35621
##D   
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## ## Random row/col/resid. Same as Bridges 1989, p. 147
##D   ## m1 <- asreml(yield ~ 1 + gen + loc + loc:gen,
##D   ##              random = ~ rowf:loc + colf:loc, data=dat)
##D 
##D   ## require(lucid)
##D   ## vc(m1)
##D   ## ##   effect component std.error z.ratio bound ##D 
##D   ## ## rowf:loc     31.62     23.02     1.4     P   0
##D   ## ## colf:loc     18.08     15.32     1.2     P   0
##D   ## ## units(R)     31.48     12.85     2.4     P   0
##D   
##D   ## ## Random row/col/resid at each loc. Matches p. 147
##D   ## m2 <- asreml(yield ~ 1 + gen + loc + loc:gen,
##D   ##              random = ~ at(loc):rowf + at(loc):colf, data=dat,
##D   ##              resid = ~ dsum( ~ units|loc))
##D   ## vc(m2)
##D   ## ##                effect component std.error z.ratio bound ##D 
##D   ## ## at(loc, Clemson):rowf     32.32    36.58     0.88     P   0
##D   ## ##  at(loc, Tifton):rowf     30.92    28.63     1.1      P   0
##D   ## ## at(loc, Clemson):colf     22.55    28.78     0.78     P   0
##D   ## ##  at(loc, Tifton):colf     13.62    14.59     0.93     P   0
##D   ## ##        loc_Clemson(R)     46.85    27.05     1.7      P   0
##D   ## ##         loc_Tifton(R)     16.11     9.299    1.7      P   0
##D   
##D   ## predict(m2, data=dat, classify='loc:gen')$pvals
##D   ## ##       loc      gen predicted.value std.error    status
##D   ## ## 1 Clemson   Dasher            45.6      5.04 Estimable
##D   ## ## 2 Clemson Guardian            31.6      5.04 Estimable
##D   ## ## 3 Clemson Poinsett            21.4      5.04 Estimable
##D   ## ## 4 Clemson   Sprint            26        5.04 Estimable
##D   ## ## 5  Tifton   Dasher            50.5      3.89 Estimable
##D   ## ## 6  Tifton Guardian            38.7      3.89 Estimable
##D   ## ## 7  Tifton Poinsett            33        3.89 Estimable
##D   ## ## 8  Tifton   Sprint            39.2      3.89 Estimable
##D 
##D   ## # Is a heterogeneous model justified? Maybe not.
##D   ## m1$loglik
##D   ## ## -67.35585
##D   ## m2$loglik
##D   ## ## -66.35621
##D 
## End(Not run)




