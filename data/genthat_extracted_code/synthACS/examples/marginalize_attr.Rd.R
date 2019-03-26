library(synthACS)


### Name: marginalize_attr
### Title: Marginalize synthetic attributes
### Aliases: marginalize_attr

### ** Examples

{
# dummy data setup
set.seed(567L)
df <- data.frame(gender= factor(sample(c("male", "female"), size= 100, replace= TRUE)),
                 age= factor(sample(1:5, size= 100, replace= TRUE)),
                 pov= factor(sample(c("below poverty", "at above poverty"), 
                                   size= 100, replace= TRUE, prob= c(.15,.85))),
                 p= runif(100))
df$p <- df$p / sum(df$p)
class(df) <- c("data.frame", "micro_synthetic")

df2 <- marginalize_attr(df, varlist= "gender")
df3 <- marginalize_attr(df, varlist= c("gender", "age"))
df4 <- marginalize_attr(df, varlist= c("gender", "age"), marginalize_out= TRUE)

df_list <- replicate(10, df, simplify= FALSE)
dummy_list <- replicate(10, list(NULL), simplify= FALSE)
df_list <- mapply(function(a,b) {return(list(a, b))}, a= dummy_list, b= df_list, SIMPLIFY = FALSE)
class(df_list) <- c("list", "synthACS")

# run the function
df_list2 <- marginalize_attr(df_list, varlist= c("gender", "age"))
}



