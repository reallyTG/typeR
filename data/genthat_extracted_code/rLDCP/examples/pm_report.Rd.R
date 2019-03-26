library(rLDCP)


### Name: pm_report
### Title: Generate the report of y
### Aliases: pm_report

### ** Examples

cp_frame <- cp("cp_frame", c("bad",
                           "middle",
                           "good"))

                           g_frame <- function(u,y){

operator <- operator(min, max)

  y$w<- infer_rules(fuzzy_rules( fuzzy_rule(0,0,1,0,0, 0,0,1,0,0, 0,0,1,0,0, 0,0,1),
                           fuzzy_rule(1,1,1,1,1, 1,1,1,1,1, 1,1,0,1,1, 1,0,0),
                           fuzzy_rule(1,1,1,1,1, 1,0,0,0,1, 0,0,1,0,0, 1,0,0),
                           fuzzy_rule(1,0,0,0,1, 1,1,1,1,1, 0,0,1,0,0, 1,0,0),
                           fuzzy_rule(0,1,0,1,0, 0,1,0,1,0, 0,0,1,0,0, 0,1,0)),
                     operator,
                     list(u[[1]]$w,u[[2]]$w,u[[3]]$w))

  y
}

t_frame <- function(y){

 templates <- c("It has been taken a bad framed photo",
                 "It has been taken a middle framed photo",
                 "It has been taken a good framed photo")

  return( templates[which.max(y$w)])
}

pm_frame <-  pm(y=cp_frame, g=g_frame, t=t_frame)
pm_report(pm_frame)



