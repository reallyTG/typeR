library(tetraclasse)


### Name: tetraclasse
### Title: tetraclasse
### Aliases: tetraclasse tetraclasse-package

### ** Examples



library(tetraclasse)


# generate an example dataset with 150 respondant
base <- gen_avis(150)

#prepare the dataset
base <- prepare_base(base)

# construct the Llosa matrix
gen_llosa(base)
 if(require("dplyr")){
gen_avis(5000) %>%
  sample_n(50,replace = TRUE)%>%
  prepare_base() %>%
  gen_llosa()



gen_avis(500) %>%
  prepare_base() %>%
  gen_llosa()

}






