library(intubate)


### Name: psychotree
### Title: Interfaces for psychotree package for data science pipelines.
### Aliases: ntbt_bttree ntbt_mpttree ntbt_pctree ntbt_raschtree
###   ntbt_rstree
### Keywords: intubate magrittr psychotree bttree mpttree pctree raschtree
###   rstree

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(psychotree)
##D 
##D 
##D ## ntbt_bttree: Bradley-Terry Tree Models
##D data("Topmodel2007", package = "psychotree")
##D 
##D ## Original function to interface
##D tm_tree <- bttree(preference ~ ., data = Topmodel2007,
##D                   minsize = 5, ref = "Barbara")
##D plot(tm_tree, abbreviate = 1, yscale = c(0, 0.5))
##D 
##D ## The interface puts data as first parameter
##D tm_tree <- ntbt_bttree(Topmodel2007, preference ~ .,
##D                        minsize = 5, ref = "Barbara")
##D plot(tm_tree, abbreviate = 1, yscale = c(0, 0.5))
##D 
##D ## so it can be used easily in a pipeline.
##D Topmodel2007 %>%
##D   ntbt_bttree(preference ~ ., minsize = 5, ref = "Barbara") %>%
##D   plot(abbreviate = 1, yscale = c(0, 0.5))
##D 
##D 
##D 
##D ## ntbt_mpttree: MPT Tree Models
##D data("SourceMonitoring", package="psychotools")
##D 
##D ## Original function to interface
##D sm_tree <- mpttree(y ~ sources + gender + age, data = SourceMonitoring,
##D                    spec = mptspec("SourceMon", .restr = list(d1 = d, d2 = d)))
##D plot(sm_tree, index = c("D1", "D2", "d", "b", "g"))
##D 
##D ## The interface puts data as first parameter
##D sm_tree <- ntbt_mpttree(SourceMonitoring, y ~ sources + gender + age,
##D                         spec = mptspec("SourceMon", .restr = list(d1 = d, d2 = d)))
##D plot(sm_tree, index = c("D1", "D2", "d", "b", "g"))
##D 
##D ## so it can be used easily in a pipeline.
##D SourceMonitoring %>%
##D   ntbt_mpttree(y ~ sources + gender + age,
##D                spec = mptspec("SourceMon", .restr = list(d1 = d, d2 = d))) %>%
##D   plot(index = c("D1", "D2", "d", "b", "g"))
##D 
##D 
##D 
##D ## ntbt_pctree: Partial Credit Tree Models
##D data("VerbalAggression", package = "psychotools")
##D VerbalAggression$s2 <- VerbalAggression$resp[, 7:12]
##D VerbalAggression <- subset(VerbalAggression, rowSums(s2) > 0 & rowSums(s2) < 12)
##D 
##D ## Original function to interface
##D pct <- pctree(s2 ~ anger + gender, data = VerbalAggression)
##D plot(pct, type = "profile")
##D 
##D ## The interface puts data as first parameter
##D pct <- ntbt_pctree(VerbalAggression, s2 ~ anger + gender)
##D plot(pct, type = "profile")
##D 
##D ## so it can be used easily in a pipeline.
##D VerbalAggression %>%
##D   ntbt_pctree(s2 ~ anger + gender) %>%
##D   plot(type = "profile")
##D 
##D 
##D 
##D ## ntbt_raschtree: Rasch Tree Models
##D data("DIFSim", package = "psychotree")
##D 
##D ## Original function to interface
##D rt <- raschtree(resp ~ age + gender + motivation, data = DIFSim)
##D plot(rt)
##D 
##D ## The interface puts data as first parameter
##D rt <- ntbt_raschtree(DIFSim, resp ~ age + gender + motivation)
##D plot(rt)
##D 
##D ## so it can be used easily in a pipeline.
##D DIFSim %>%
##D   ntbt_raschtree(resp ~ age + gender + motivation) %>%
##D   plot()
##D 
##D 
##D 
##D ## ntbt_rstree: Rating Scale Tree Models
##D data("VerbalAggression", package = "psychotools")
##D VerbalAggression$s1 <- VerbalAggression$resp[, 1:6]
##D VerbalAggression <- subset(VerbalAggression, rowSums(s1) > 0 & rowSums(s1) < 12)
##D 
##D ## Original function to interface
##D rst <- rstree(s1 ~ anger + gender, data = VerbalAggression)
##D plot(rst, type = "profile")
##D 
##D ## The interface puts data as first parameter
##D rst <- ntbt_rstree(VerbalAggression, s1 ~ anger + gender)
##D plot(rst, type = "profile")
##D 
##D ## so it can be used easily in a pipeline.
##D VerbalAggression %>%
##D   ntbt_rstree(s1 ~ anger + gender) %>%
##D   plot(type = "profile")
## End(Not run)



