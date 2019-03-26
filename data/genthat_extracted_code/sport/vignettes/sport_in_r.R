## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----message=FALSE, warning=FALSE----------------------------------------
# devtools::install_github("gogonzo/sport")
# install.packages("sport")
library(sport)

## ----echo=TRUE-----------------------------------------------------------
str(gpheats)

## ----echo=FALSE----------------------------------------------------------
gpheats[1:8,c("id","rider","rank")]

## ----message=FALSE-------------------------------------------------------
glicko  <- glicko_run(  formula = rank|id ~ rider, data = gpheats )
glicko2 <- glicko2_run( formula = rank|id ~ rider, data = gpheats )
bbt     <- bbt_run(     formula = rank|id ~ rider, data = gpheats )
dbl     <- dbl_run(     formula = rank|id ~ rider, data = gpheats )
print(dbl)

## ------------------------------------------------------------------------
summary(dbl)

## ------------------------------------------------------------------------
plot(glicko, n=15)
plot(glicko, players = c("Greg Hancock","Nicki Pedersen","Jason Crump"))

## ------------------------------------------------------------------------
names(glicko)

## ------------------------------------------------------------------------
tail(glicko$r)
tail(glicko$pairs)

## ----message=FALSE, warning=FALSE----------------------------------------
library(dplyr); library(magrittr) # for examples purpose 
data <- data.frame( id = 1, name = c( "A", "B", "C", "D" ),  rank  = c( 3, 4, 1, 2 ))
r     <- setNames( c(1500, 1400, 1550, 1700), c("A","B","C","D") )
rd    <- setNames( c(200, 30, 100, 300), c("A","B","C","D") )

model <- glicko_run(rank|id ~ name, data=data, r=r, rd=rd)
print(model$final_r)


## ------------------------------------------------------------------------
data2 <- data.frame( id = 2, name = c( "A", "B", "C", "D" ),  rank  = 1:4 )
r     <- model$final_r
rd    <- model$final_rd

glicko_run(rank|id ~ name, data, r=r, rd=rd)$final_r

## ------------------------------------------------------------------------
gpheats %<>% mutate(weight = ifelse(heat >= (max(heat)-3),2,1) )
glicko  <- glicko_run(rank|id ~ rider, gpheats, weight="weight")

## ------------------------------------------------------------------------
bbt1 <- bbt_run(rank|id~rider, gpheats,kappa=0.9)
bbt2 <- bbt_run(rank|id~rider, gpheats,kappa=0.5)

all(bbt1$final_rd > bbt2$final_rd)

## ------------------------------------------------------------------------
gpheats %<>% mutate(beta = ifelse(heat >= (max(heat)-3),2,1)  )
dbl <- dbl_run(rank|id~rider, beta="beta", data=gpheats) 

## ------------------------------------------------------------------------
sigma   <- unique(gpheats$rider) %>% setNames( runif(0.1,0.5, n = length(.)) , . )
glicko2 <- glicko2_run(rank|id~rider,gpheats, sigma=sigma)

## ------------------------------------------------------------------------
# bbt example
gpheats %<>%
  group_by(rider) %>%
  mutate( days_scaled = as.integer(date - lag(date))/90,
          days_scaled = if_else(days_scaled>1,1.0, days_scaled)) %>%
  filter( !is.na(days_scaled) )

bbt <- bbt_run( rank|id ~ rider, data=gpheats, sigma="days_scaled")

