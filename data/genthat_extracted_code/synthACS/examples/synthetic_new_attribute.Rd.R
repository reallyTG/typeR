library(synthACS)


### Name: synthetic_new_attribute
### Title: Add a new attribute to a synthetic_micro dataset
### Aliases: synthetic_new_attribute

### ** Examples

{
set.seed(567L)
df <- data.frame(gender= factor(sample(c("male", "female"), size= 100, replace= TRUE)),
                edu= factor(sample(c("LT_college", "BA_degree"), size= 100, replace= TRUE)),
                p= runif(100))
df$p <- df$p / sum(df$p)
class(df) <- c("data.frame", "micro_synthetic")
ST <- data.frame(gender= c(rep("male", 3), rep("female", 3)),
                 attr_pct= c(0.1, 0.8, 0.1, 0.05, 0.7, 0.25),
                 levels= rep(c("low", "middle", "high"), 2))
df2 <- synthetic_new_attribute(df, prob_name= "p", attr_name= "SES", conditional_vars= "gender",
         sym_tbl= ST)

ST2 <- data.frame(gender= c(rep("male", 3), rep("female", 6)),
                  edu= c(rep(NA, 3), rep(c("LT_college", "BA_degree"), each= 3)),
                  attr_pct= c(0.1, 0.8, 0.1, 10, 80, 10, 5, 70, 25),
                  levels= rep(c("low", "middle", "high"), 3))
df2 <- synthetic_new_attribute(df, prob_name= "p", attr_name= "SES",
         conditional_vars= c("gender", "edu"),
         sym_tbl= ST2)
}



