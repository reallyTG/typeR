library(agridat)


### Name: verbyla.lupin
### Title: Multi-environment trial of lupin, multiple varieties and
###   densities
### Aliases: verbyla.lupin

### ** Examples


data(verbyla.lupin)
dat <- verbyla.lupin

# The same RCB randomization was used at all sites in each year
if(require(desplot)){
  desplot(gen~col+row|site, data=dat,
          out1=rep, num=rate,
          # aspect unknown
          main="verbyla.lupin - experiment design")
}

# Figure 3 of Verbyla
require(lattice)
foo <- xyplot(yield ~ rate|loc*gen, data=dat, subset=year==92,
              type=c('p','smooth'), cex=.5,
              main="verbyla.lupin: 1992 yield response curves",
              xlab="Seed rate (plants/m^2)",
              ylab="Yield (tons/ha)",
              strip=strip.custom(par.strip.text=list(cex=.7)))

if (require(latticeExtra)) { # for useOuterStrips
  useOuterStrips(foo,
                 strip=strip.custom(par.strip.text=list(cex=.7)),
                 strip.left=strip.custom(par.strip.text=list(cex=.7)))
}

# ----------------------------------------------------------------------------

## Not run: 
##D   
##D   # We try to reproduce the analysis of Verbyla 1999.
##D   # May not be exactly the same, but is pretty close.
##D   
##D   # Check nlevels for size of random-coefficient structures
##D   length(with(dat, table(gen)))      # 9 varieties for RC1
##D   length(with(dat, table(gen,site))) # 99 site:gen combinations for RC2
##D   
##D   # Make row and col into factors
##D   dat <- transform(dat, colf=factor(col), rowf=factor(row))
##D   # sort for asreml
##D   dat <- dat[order(dat$site, dat$rowf, dat$colf),]
##D   
##D   # Make site names more useful for plots
##D   dat <- transform(dat, site=factor(paste0(year,".",substring(loc,1,4))))
##D   
##D   # Initial model from top of Verbyla table 9.
##D #  require(asreml4)
##D   # FIXME asreml4 This is not working in asreml4
##D   
##D ##   m0 <- asreml(yield ~ 1
##D ##                + site
##D ##                + linrate
##D ##                + site:linrate,
##D ##                data = dat,
##D ##                random = ~ spl(rate)
##D ##                + dev(rate)
##D ##                + site:spl(rate)
##D ##                + site:dev(rate)
##D ##                + str(~gen+gen:linrate, ~us(2):id(9)) # RC1
##D ##                + gen:spl(rate)
##D ##                + gen:dev(rate)
##D ##                + str(~site:gen+site:gen:linrate, ~us(2):id(99)) # RC2
##D ##                + site:gen:spl(rate)
##D ##                + site:gen:dev(rate),
##D ##                residual = ~ dsum( ~ ar1(rowf):ar1(colf)|site) # Spatial AR1 x AR1
##D ##              )
##D ## m0 <- update(m0)
##D ## m0 <- update(m0) # to get convergence
##D 
##D ## # Variograms match Verbyla 1999 figure 7 (scale slightly different)
##D ## plot(varioGram(m0), xlim=c(1:19), zlim=c(0,2),
##D ##      main="verbyla.lupin - variogram by site")
##D   
##D ##   # Sequence of models in Verbyla 1999 table 10
##D ## m1 <- update(m0, fixed= ~ .
##D ##              + at(site, c(2,5,6,8,9,10)):lincol
##D ##              + at(site, c(3,5,7,8)):linrow
##D ##              + at(site, c(2,3,5,7,8,9,11)):serp
##D ##              , random = ~ .
##D ##              + at(site, c(3,6,7,9)):rowf
##D ##              + at(site, c(1,2,3,9,10)):colf
##D ##              + at(site, c(5,7,8,10)):units)
##D ## m1 <- update(m1)
##D 
##D ## m2 <- update(m1,
##D ##              random = ~ .
##D ##              - site:gen:spl(rate) - site:gen:dev(rate))
##D 
##D ## m3 <- update(m2,
##D ##              random = ~ .
##D ##              - site:dev(rate) - gen:dev(rate))
##D              
##D ## m4 <- update(m3,
##D ##              random = ~ .
##D ##              - dev(rate))
##D 
##D ## m5 <- update(m4,
##D ##              random = ~ .
##D ##              - at(site, c(5,7,8,10)):units + at(site, c(5,7,8)):units)
##D 
##D ## # Variance components are a pretty good match to Verbyla 1997, table 15
##D ## require(lucid)
##D ## vc(m5)
##D ## .001004/sqrt(.005446*.0003662) # .711 correlation for RC1
##D ## .00175/sqrt(.01881*.000167) # .987 correlation for RC2
##D 
##D ## # Matches Verbyla 1999 figure 5
##D ## plot(varioGram(m5),
##D ##      main="verbyla.lupin - final model variograms",
##D ##      xlim=c(1:19), zlim=c(0,1.5))
##D 
## End(Not run)




