library(agridat)


### Name: hanks.sprinkler
### Title: Wheat yields in a line-source sprinkler experiment
### Aliases: hanks.sprinkler

### ** Examples


data(hanks.sprinkler)
dat <- hanks.sprinkler

# The line sprinkler is vertical between subplots 6 & 7
if(require(desplot)){
  desplot(yield~subplot*row, dat,
          out1=block, out2=irr, cex=1, # aspect unknown
          num=gen, main="hanks.sprinkler")
}

require(lattice)
xyplot(yield~subplot|block, dat, type=c('b'), group=gen,
       layout=c(1,3), auto.key=TRUE,
       main="hanks.sprinkler",
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         panel.abline(v=6.5, col='wheat')
       })

# ----------------------------------------------------------------------------

## This is the model from the SAS documentation
## proc mixed;
## class block gen dir irr;
## model yield = gen|dir|irr@2;
## random block block*dir block*irr;
## repeated / type=toep(4) sub=block*gen r;

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   
##D   dat <- transform(dat, subf=factor(subplot),
##D                    irrf=factor(irr))
##D   dat <- dat[order(dat$block, dat$gen, dat$subplot),]
##D   
##D   m1 <- asreml(yield ~ gen + dir + irrf + gen:dir + gen:irrf + dir:irrf,
##D                data=dat,
##D                random= ~ block + block:dir + block:irrf,
##D                rcov= ~ block:gen:corb(subf, k=3))
##D 
##D   require(lucid)
##D   vc(m1)
##D   ##                effect component std.error z.ratio constr
##D   ##       block!block.var  0.2194     0.2393     0.92    pos
##D   ##   block:dir!block.var  0.01768    0.03154    0.56    pos
##D   ##  block:irrf!block.var  0.03539    0.03617    0.98    pos
##D   ##            R!variance  0.285      0.05086    5.6     pos
##D   ##                R!cor1  0.02802    0.1143     0.25  uncon
##D   ##                R!cor2  0.005095   0.1278     0.04  uncon
##D   ##                R!cor3 -0.3246     0.0905    -3.6   uncon
##D   
##D   ## # convert asreml correlations to SAS covariances
##D   ## round(.2850 * c(1, .02802, .005095, -.3246),4) # res var * (cor1, cor2, cor3)
##D   ## [1]  0.2850  0.0080  0.0015 -0.0925
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   
##D   ## dat <- transform(dat, subf=factor(subplot),
##D   ##                  irrf=factor(irr))
##D   ## dat <- dat[order(dat$block, dat$gen, dat$subplot),]
##D 
##D   ## # FIXME asreml4
##D   ## m1 <- asreml(yield ~ gen + dir + irrf + gen:dir + gen:irrf + dir:irrf,
##D   ##              data=dat,
##D   ##              random= ~ block + block:dir + block:irrf,
##D   ##              resid = ~ block:gen:corb(subf, b=3))
##D 
##D   ## require(lucid)
##D   ## vc(m1)
##D   ## ##                effect component std.error z.ratio constr
##D   ## ##       block!block.var  0.2194     0.2393     0.92    pos
##D   ## ##   block:dir!block.var  0.01768    0.03154    0.56    pos
##D   ## ##  block:irrf!block.var  0.03539    0.03617    0.98    pos
##D   ## ##            R!variance  0.285      0.05086    5.6     pos
##D   ## ##                R!cor1  0.02802    0.1143     0.25  uncon
##D   ## ##                R!cor2  0.005095   0.1278     0.04  uncon
##D   ## ##                R!cor3 -0.3246     0.0905    -3.6   uncon
##D   
##D   ## ## # convert asreml correlations to SAS covariances
##D   ## ## round(.2850 * c(1, .02802, .005095, -.3246),4) # res var * (cor1, cor2, cor3)
##D   ## ## [1]  0.2850  0.0080  0.0015 -0.0925
##D 
##D   ## detach(package:asreml4)
## End(Not run)




