library(TropFishR)


### Name: select_ogive
### Title: Selectivity patterns
### Aliases: select_ogive

### ** Examples

# create list with selectivity information
select.list <- list(selecType = 'knife_edge',
   Lc = 34, L75 = 37, tc = 5, meshSizes = c(60,80),
   select_p1 = 2.7977, select_p2 = 0.1175)


# create vector with mid lengths
Lt <- seq(5, 50, 0.01)

# knife edge selectivity
sel_ke <- select_ogive(select.list, Lt)

# trawl ogive selectivity
select.list$selecType = "trawl_ogive"
sel_to <- select_ogive(select.list, Lt)

plot(Lt, sel_ke, type = 'l')
lines(Lt, sel_to, col = 'blue')


# Gillnet selectivity ("lognormal" and "normal_fixed")
select.list$selecType <- "lognormal"
sel_log <- select_ogive(select.list, Lt)

select.list$selecType <- "normal_fixed"
select.list$select_p1 <- 0.2
select.list$select_p2 <- 1.5
sel_nf <- select_ogive(select.list, Lt)

plot(Lt, sel_log, type = 'l')
lines(Lt, sel_nf, col = 'blue')




