library(xxIRT)


### Name: mst
### Title: Computerized Multistage Testing (MST)
### Aliases: mst mst mst_route mst_obj mst_constraint mst_stage_length
###   mst_rdp mst_module_info mst_assemble print.mst plot.mst mst_get_items

### ** Examples

## Not run: 
##D ## generate item pool
##D num_item <- 300
##D pool <- with(model_3pl_gendata(1, num_item), data.frame(a=a, b=b, c=c))
##D pool$id <- 1:num_item
##D pool$content <- sample(1:3, num_item, replace=TRUE)
##D pool$time <- round(rlnorm(num_item, 4, .3))
##D pool$group <- sort(sample(1:round(num_item/3), num_item, replace=TRUE))
##D 
##D ## ex. 1: 1-2-2 MST, 2 panels, topdown
##D ## 20 items in total and 10 items in content area 1 in each route
##D ## maximize info. at -1 and 1 for easy and hard routes
##D x <- mst(pool, "1-2-2", 2, 'topdown', len=20, max_use=1)
##D x <- mst_obj(x, theta=-1, indices=1:2)
##D x <- mst_obj(x, theta=1, indices=3:4)
##D x <- mst_constraint(x, "content", 10, 10, level=1)
##D x <- mst_assemble(x, timeout=5)
##D plot(x, byroute=TRUE)
##D for(p in 1:x$num_panel)
##D   for(r in 1:x$num_route) {
##D      route <- paste(x$route[r, 1:x$num_stage], collapse='-')
##D      count <- sum(mst_get_items(x, panel_ix=p, route_ix=r)$content==1)
##D      cat('panel=', p, ', route=', route, ': ', count, ' items in content area #1\n', sep='')
##D   }
##D 
##D ## ex. 2: 1-2-3 MST, 2 panels, bottomup,
##D ## remove two routes with large theta change: 1-2-6, 1-3-4 
##D ## 10 items in total and 4 items in content area 2 in each module
##D ## maximize info. at -1, 0 and 1 for easy, medium, and hard modules
##D x <- mst(pool, "1-2-3", 2, 'bottomup', len=10, max_use=1)
##D x <- mst_route(x, c(1, 2, 6), "-")
##D x <- mst_route(x, c(1, 3, 4), "-")
##D x <- mst_obj(x, theta= 0, indices=c(1, 5))
##D x <- mst_obj(x, theta=-1, indices=c(2, 4))
##D x <- mst_obj(x, theta= 1, indices=c(3, 6))
##D x <- mst_constraint(x, "content", 4, 4, level=2)
##D x <- mst_assemble(x, timeout=10) 
##D plot(x, byroute=FALSE)
##D for(p in 1:x$num_panel)
##D   for(m in 1:x$num_module){
##D     count <- sum(mst_get_items(x, panel_ix=p, module_ix=m)$content==2)
##D     cat('panel=', p, ', module=', m, ': ', count, ' items in content area #2\n', sep='')
##D   }
##D  
##D ## ex.3: same with ex.2 (w/o content constraints), but group-based  
##D x <- mst(pool, "1-2-3", 2, 'bottomup', len=12, max_use=1, group="group")
##D x <- mst_route(x, c(1, 2, 6), "-")
##D x <- mst_route(x, c(1, 3, 4), "-")
##D x <- mst_obj(x, theta= 0, indices=c(1, 5))
##D x <- mst_obj(x, theta=-1, indices=c(2, 4))
##D x <- mst_obj(x, theta= 1, indices=c(3, 6))
##D x <- mst_assemble(x, timeout=10)
##D plot(x, byroute=FALSE)
##D for(p in 1:x$num_panel)
##D   for(m in 1:x$num_module){
##D     items <- mst_get_items(x, panel_ix=p, module_ix=m)
##D     cat('panel=', p, ', module=', m, ': ', length(unique(items$id)), ' items from ', 
##D         length(unique(items$group)), ' groups\n', sep='')
##D   }
##D   
##D ## ex.4: 2 panels of 1-2-3 top-down design
##D ## 20 total items and 10 items in content area 3
##D ## 6+ items in stage 1 & 2
##D x <- mst(pool, "1-2-3", 2, "topdown", len=20, max_use=1)
##D x <- mst_route(x, c(1, 2, 6), "-")
##D x <- mst_route(x, c(1, 3, 4), "-")
##D x <- mst_obj(x, theta=-1, indices=1)
##D x <- mst_obj(x, theta=0, indices=2:3)
##D x <- mst_obj(x, theta=1, indices=4)
##D x <- mst_constraint(x, "content", 10, 10, level=3)
##D x <- mst_stage_length(x, 1:2, min=6)
##D x <- mst_assemble(x, timeout=15)
##D head(x$items)
##D plot(x, byroute=FALSE)
##D for(p in 1:x$num_panel)
##D   for(s in 1:x$num_stage){
##D     items <- mst_get_items(x, panel_ix=p, stage_ix=s)
##D     cat('panel=', p, ', stage=', s, ': ', length(unique(items$id)), ' items\n', sep='')
##D   }
##D 
##D ## ex.5: same with ex.4, but use RDP instead of stage length to control routing errors
##D x <- mst(pool, "1-2-3", 2, "topdown", len=20, max_use=1)
##D x <- mst_route(x, c(1, 2, 6), "-")
##D x <- mst_route(x, c(1, 3, 4), "-")
##D x <- mst_obj(x, theta=-1, indices=1)
##D x <- mst_obj(x, theta=0, indices=2:3)
##D x <- mst_obj(x, theta=1, indices=4)
##D x <- mst_constraint(x, "content", 10, 10, level=3)
##D x <- mst_rdp(x, 0, 2:3, .1)
##D x <- mst_module_mininfo(x, 0, 5, 2:3)
##D x <- mst_assemble(x, timeout=15)
##D plot(x, byroute=FALSE)
## End(Not run)



