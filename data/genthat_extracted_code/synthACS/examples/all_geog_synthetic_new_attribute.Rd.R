library(synthACS)


### Name: all_geog_synthetic_new_attribute
### Title: Add a new attribute to a set (ie list) of synthetic_micro
###   datasets
### Aliases: all_geog_synthetic_new_attribute

### ** Examples

## Not run: 
##D  set.seed(567L)
##D  df <- data.frame(gender= factor(sample(c("male", "female"), size= 100, replace= TRUE)),
##D                  age= factor(sample(1:5, size= 100, replace= TRUE)),
##D                  pov= factor(sample(c("lt_pov", "gt_eq_pov"),
##D                                     size= 100, replace= TRUE, prob= c(.15,.85))),
##D                  p= runif(100))
##D df$p <- df$p / sum(df$p)
##D class(df) <- c("data.frame", "micro_synthetic")
##D 
##D # and example test elements
##D cond_v <- c("gender", "pov")
##D levels <- c("employed", "unemp", "not_in_LF")
##D sym_tbl <- data.frame(gender= rep(rep(c("male", "female"), each= 3), 2),
##D                       pov= rep(c("lt_pov", "gt_eq_pov"), each= 6),
##D                       cnts= c(52, 8, 268, 72, 12, 228, 1338, 93, 297, 921, 105, 554),
##D                       lvls= rep(levels, 4))
##D 
##D 
##D 
##D df_list <- replicate(10, df, simplify= FALSE)
##D st_list <- replicate(10, sym_tbl, simplify= FALSE)
##D 
##D # run
##D library(parallel)
##D syn <- all_geog_synthetic_new_attribute(df_list, prob_name= "p", attr_name= "variable",
##D                                         conditional_vars= cond_v,st_list= st_list)
## End(Not run)



