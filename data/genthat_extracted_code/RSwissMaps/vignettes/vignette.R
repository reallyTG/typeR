## ----include=FALSE, cache=FALSE------------------------------------------
library(RSwissMaps, quietly = T)

## ------------------------------------------------------------------------
dt <- mun.template(year = 2016)

for(i in 1:nrow(dt)){
  
  dt$values[i] <- sample(c(400:600), 1)/1000
  
}

## ------------------------------------------------------------------------
mun.plot(dt$bfs_nr, dt$values, 2016)


## ------------------------------------------------------------------------
mun.plot(dt$bfs_nr, dt$values, 2016, 
         cantons = c("AG", "ZH"), 
         lakes = c("Hallwilersee", "Greifensee", "Zürichsee"), 
         title = "title goes here", 
         subtitle = "subtitle goes here", 
         caption = "caption goes here", 
         legend_title = "Percentage")

## ------------------------------------------------------------------------
dt2 <- dis.template(year = 2016)

for(i in 1:nrow(dt2)){
  
  dt2$values[i] <- sample(c(400:600), 1)/1000
  
}

## ------------------------------------------------------------------------
dis.plot(dt2$bfs_nr, dt2$values, 2016)


## ------------------------------------------------------------------------
dis.plot(dt2$bfs_nr, dt2$values, 2016, 
         cantons = c("AG", "BE", "SO"), 
         lakes = c("Hallwilersee", "Bielersee", "Brienzersee", "Thunersee"), 
         title = "title goes here", 
         subtitle = "subtitle goes here", 
         caption = "caption goes here", 
         legend_title = "Percentage")

## ------------------------------------------------------------------------
dt3 <- can.template(year = 2016)

for(i in 1:nrow(dt3)){
  
  dt3$values[i] <- sample(c(400:600), 1)/1000
  
}

## ------------------------------------------------------------------------
can.plot(dt3$bfs_nr, dt3$values, 2016)


## ------------------------------------------------------------------------
can.plot(dt3$bfs_nr, dt3$values, 2016, 
         title = "title goes here", 
         subtitle = "subtitle goes here", 
         caption = "caption goes here", 
         legend_title = "Percentage")

