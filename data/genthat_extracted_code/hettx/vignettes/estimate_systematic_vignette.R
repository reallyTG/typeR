## ------------------------------------------------------------------------
library( hettx )

## ------------------------------------------------------------------------
df = make.randomized.dat( 10000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
str( df )

## ------------------------------------------------------------------------
rs = estimate_systematic( Yobs ~ Z,  interaction.formula = ~ A + B, data=df )
summary(rs)

## ------------------------------------------------------------------------
vcov( rs )
SE( rs )

## ------------------------------------------------------------------------
confint( rs )

## ------------------------------------------------------------------------
M.ols.ours = estimate_systematic( Yobs ~ Z, ~ A + B, data=df, method="OLS" )
summary(M.ols.ours)
M.ols.ours$beta.hat

## ------------------------------------------------------------------------
M0 = lm( Yobs ~ (A+B) * Z, data=df )
M0

## ------------------------------------------------------------------------
M.ols.ours$beta - coef(M0)[4:6]

## ------------------------------------------------------------------------
estimate_systematic( Yobs ~ Z, interaction.formula = ~ A + B, 
          control.formula = ~ C, data=df )

## ------------------------------------------------------------------------
rsA2 = estimate_systematic( Yobs ~ Z,  ~ A + B, ~ A + B + C, data=df )
coef( rsA2 )

## ------------------------------------------------------------------------
rsB = estimate_systematic( Yobs ~ Z,  ~ A + B, ~ C, data=df, method = "OLS" )
coef( rsB )
rsB2 = estimate_systematic( Yobs ~ Z,  ~ A + B, ~ A + B + C, data=df, method = "OLS" )
coef( rsB2 )

## ------------------------------------------------------------------------
rsB.lm = lm( Yobs ~ Z * (A+B) + C, data=df )
coef( rsB.lm )
cbind( C.only=coef( rsB ), ABC=coef( rsB2 ), lmC=coef( rsB.lm )[c(2,6,7)])

## ------------------------------------------------------------------------
Moracle = estimate_systematic( Y.1 + Y.0 ~ Z, ~ A + B, data=df )
summary(Moracle)
SE( Moracle )

## ------------------------------------------------------------------------
df = make.randomized.dat( 1000, beta.vec=c(-1,1,1) )
rs = estimate_systematic( Yobs ~ Z, ~ A + B, data=df, method="OLS" )
r2 = R2( rs )
r2

## ------------------------------------------------------------------------
df = make.randomized.dat( 1000, beta.vec=c(-1,1,1), ideo.sd=3 )
rs = estimate_systematic( Yobs ~ Z, ~ A + B, data=df, method="OLS" )
r2b = R2( rs )
r2b    

## ------------------------------------------------------------------------
plot( r2 )
plot( r2b, ADD=TRUE, col="green" )

## ------------------------------------------------------------------------
df = make.randomized.dat( 1000, beta.vec=c(-1,1,0) )
rs = estimate_systematic( Yobs ~ Z, ~ A + B, data=df, method="OLS" )
r2 = R2( rs )
r2    
plot( r2 )

## ------------------------------------------------------------------------
plot( df$tau ~ df$A )

## ------------------------------------------------------------------------
set.seed( 1020 )
df = make.randomized.dat( 1000, beta.vec=c(-1,1,1), 
                          gamma.vec = c( 1, 2, 2, 1 ),
                          ideo.sd=1 )

rs = estimate_systematic( Yobs ~ Z, ~ A + B, data=df )
r2 = R2( rs )
plot( r2, col="green" )

# adjusted
rs = estimate_systematic( Yobs ~ Z, ~ A + B, ~ C, data=df )
r2 = R2( rs )
plot( r2, ADD=TRUE )

# adjusted + OLS
rs = estimate_systematic( Yobs ~ Z, ~ A + B, ~ C, data=df, method = "OLS" )
r2 = R2( rs )
plot( r2, ADD=TRUE, col="blue" )

## ------------------------------------------------------------------------
beta = c(-1,6,0)
n = 10000

data = make.randomized.compliance.dat( n, beta.vec=beta )
names(data)

## ----observed_subgroups--------------------------------------------------
zd = with( data, interaction( Z, D, sep="-" ) )
boxplot( Yobs ~ zd, data=data, ylab="Yobs")

## ---- fig.width = 7------------------------------------------------------
par( mfrow=c(1,2), mgp=c(1.8,0.8,0), mar=c(3,3,0.5,0.5) )
plot( Y.1 - Y.0 ~ A, data=data, col=as.factor(data$S), pch=19, cex=0.5 )
plot( Y.1 - Y.0 ~ B, data=data, col=as.factor(data$S), pch=19, cex=0.5 )
legend( "topleft", legend=levels( as.factor( data$S ) ), pch=19, col=1:3 )

## ------------------------------------------------------------------------
prop.table( table( data$S ) )

## ------------------------------------------------------------------------
rs = estimate_systematic( Yobs ~ D | Z, ~ A + B, data=data )
summary(rs)
rs$beta.hat
SE( rs )

## ------------------------------------------------------------------------
r2 = R2( rs )
r2
plot( r2 )

## ------------------------------------------------------------------------
rs2SLS = estimate_systematic( Yobs ~ Z | D,  ~ A + B, data=data, method="2SLS" )
summary(rs2SLS)
SE( rs2SLS )

## ------------------------------------------------------------------------
err = rs$beta.hat - beta
err2SLS = rs2SLS$beta.hat - beta
data.frame( SE.RI = SE( rs ), err.RI=err, SE.2SLS = SE( rs2SLS ), err.2SLS = err2SLS )

