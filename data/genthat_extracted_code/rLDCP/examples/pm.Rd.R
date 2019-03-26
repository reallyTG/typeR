library(rLDCP)


### Name: pm
### Title: Define the PM
### Aliases: pm

### ** Examples

## Not run: 
##D cp_depth <- cp("cp_depth",c("far",
##D                             "bit far",
##D                             "good",
##D                             "close",
##D                             "very close"))
##D 
##D g_depth <- function(u,y){
##D   y$w <- degree_mf(fuzzy_partitions(triangle_mf(450,450,550),
##D                                  triangle_mf( 450,550,600),
##D                                  trapezoid_mf(550,600,800, 1000),
##D                                  triangle_mf( 800,1000,1300),
##D                                  trapezoid_mf( 1000,1300,1500,1500)),u)
##D   y
##D }
##D 
##D pm_depth  <- pm(y=cp_depth, g=g_depth)
##D 
##D ########################### HEIGHT DEFINITION ###########################################
##D cp_height <- cp("cp_height", c("high",
##D                              "average high",
##D                              "centered",
##D                              "average low",
##D                              "low"))
##D 
##D g_height <- function(u,y){
##D   y$w <- degree_mf(fuzzy_partitions(trapezoid_mf(-1000,-1000,-600,-400),
##D                                                triangle_mf(-600,-400,0),
##D                                                trapezoid_mf(-400,0,200,400),
##D                                                triangle_mf(200,400,600),
##D                                                trapezoid_mf(400,600,1000,1000)),u)
##D   y
##D }
##D 
##D pm_height <- pm(y=cp_height, g=g_height)
##D 
##D ########################### WIDTH DEFINITION ###########################################
##D cp_width <- cp("cp_width",  c("left",
##D                                "average left",
##D                                 "centered",
##D                                 "average right",
##D                                  "right"))
##D 
##D g_width <- function(u,y){
##D   y$w <- degree_mf(fuzzy_partitions(triangle_mf(-1000,-600,-400),
##D                                                triangle_mf(-600,-400,0),
##D                                               triangle_mf(-400,0,400),
##D                                                triangle_mf(0,400,600),
##D                                                triangle_mf(400,600,1000,1000)),
##D                               u)
##D   y
##D }
##D 
##D pm_width  <- pm(y=cp_width,  g=g_width)
##D 
##D ########################### FRAME DEFINITION ###########################################
##D cp_frame <- cp("cp_frame", c("bad",
##D                              "middle",
##D                              "good"))
##D 
##D g_frame <- function(u,y){
##D 
##D   operator <- operator(min, max)
##D 
##D   y$w<- infer_rules(fuzzy_rules( fuzzy_rule(0,0,1,0,0, 0,0,1,0,0, 0,0,1,0,0, 0,0,1),
##D                            fuzzy_rule(1,1,1,1,1, 1,1,1,1,1, 1,1,0,1,1, 1,0,0),
##D                            fuzzy_rule(1,1,1,1,1, 1,0,0,0,1, 0,0,1,0,0, 1,0,0),
##D                            fuzzy_rule(1,0,0,0,1, 1,1,1,1,1, 0,0,1,0,0, 1,0,0),
##D                            fuzzy_rule(0,1,0,1,0, 0,1,0,1,0, 0,0,1,0,0, 0,1,0)),
##D                      operator,
##D                      list(u[[1]]$w,u[[2]]$w,u[[3]]$w))
##D 
##D   y
##D }
##D 
##D t_frame <- function(y){
##D 
##D   templates <- c("It has been taken a bad framed photo",
##D                  "It has been taken a middle framed photo",
##D                  "It has been taken a good framed photo")
##D 
##D   return( templates[which.max(y$w)])
##D }
##D 
##D pm_frame <-  pm(y=cp_frame, g=g_frame, t=t_frame)
## End(Not run)



