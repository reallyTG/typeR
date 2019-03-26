library(xxIRT)


### Name: ata
### Title: Automated Test Assembly (ATA)
### Aliases: ata ata print.ata plot.ata ata_obj_relative ata_obj_absolute
###   ata_constraint ata_item_use ata_item_enemy ata_item_fixedvalue
###   ata_solve

### ** Examples

## Not run: 
##D ## generate a 100-item pool
##D nitems <- 100
##D pool <- with(model_3pl_gendata(1, nitems), data.frame(id=1:nitems, a=a, b=b, c=c))
##D pool$id <- 1:nitems
##D pool$content <- sample(1:3, nitems, replace=TRUE)
##D pool$time <- round(rlnorm(nitems, log(60), .2))
##D pool$group <- sort(sample(1:round(nitems/3), nitems, replace=TRUE))
##D 
##D ## ex. 1: 6 forms, 10 items, maximize b parameter
##D x <- ata(pool, 6, len=10, max_use=1)
##D x <- ata_obj_relative(x, "b", "max")
##D x <- ata_solve(x, timeout=5)
##D sapply(x$items, function(x) c(mean=mean(x$b), std=sd(x$b)))
##D 
##D ## ex. 2: 3 forms, 10 items, minimize b parameter
##D x <- ata(pool, 3, len=10, max_use=1)
##D x <- ata_obj_relative(x, "b", "min", negative=TRUE)
##D x <- ata_solve(x, as.list=FALSE, timeout=5)
##D with(x$items, aggregate(b, by=list(form=form), mean))
##D 
##D ## ex. 3: 2 forms, 10 items, mean(b) = 0, sd(b) = 1.0, content = (3, 3, 4)
##D x <- ata(pool, 2, len=10, max_use=1)
##D x <- ata_obj_absolute(x, pool$b, 0 * 10)
##D x <- ata_obj_absolute(x, (pool$b - 0)^2, 1 * 10)
##D x <- ata_constraint(x, "content", min=3, max=3, level=1)
##D x <- ata_constraint(x, "content", min=3, max=3, level=2)
##D x <- ata_constraint(x, "content", min=4, max=4, level=3)
##D x <- ata_solve(x, timeout=5)
##D sapply(x$items, function(x) c(mean=mean(x$b), sd=sd(x$b)))
##D 
##D ## ex. 4: same with ex. 3, but group-based
##D x <- ata(pool, 2, len=10, max_use=1, group="group")
##D x <- ata_obj_absolute(x, pool$b, 0 * 10)
##D x <- ata_obj_absolute(x, (pool$b - 0)^2, 1 * 10)
##D x <- ata_constraint(x, "content", min=3, max=3, level=1)
##D x <- ata_constraint(x, "content", min=3, max=3, level=2)
##D x <- ata_constraint(x, "content", min=4, max=4, level=3)
##D x <- ata_solve(x, timeout=5)
##D sapply(x$items, function(x) c(mean=mean(x$b), sd=sd(x$b), 
##D        n_items=length(unique(x$id)), n_groups=length(unique(x$group))))
##D 
##D # ex. 5: 2 forms, 10 items, flat TIF over [-1, 1]
##D x <- ata(pool, 2, len=10, max_use=1)
##D x <- ata_obj_relative(x, seq(-1, 1, .5), "max")
##D x <- ata_solve(x)
##D plot(x)
## End(Not run)



