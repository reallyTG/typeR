## ---- echo=FALSE---------------------------------------------------------
  set.seed(17760701)
  knitr::opts_chunk$set(
    collapse = TRUE,
    comment = "#>"
  )
  options(digits=2)

## ------------------------------------------------------------------------
# Load built-in dataset
data(HairEyeColor)
HairEyeColor <- data.frame(HairEyeColor)

# Transform so each row is a subject
# Columns describe subject's hair color, eye color, and gender
hec <- HairEyeColor[rep(1:nrow(HairEyeColor),
                        times = HairEyeColor$Freq), 1:3]

N <- nrow(hec)

# Fix the rownames
rownames(hec) <- NULL

## ------------------------------------------------------------------------
# Set a seed for reproducability
set.seed(343)

# Create untreated and treated outcomes for all subjects
hec <- within(hec,{
  Y0 <- rnorm(n = N,mean = (2*as.numeric(Hair) + -4*as.numeric(Eye) + -6*as.numeric(Sex)), sd = 5)
  Y1 <- Y0 + 6*as.numeric(Hair) + 4*as.numeric(Eye) + 2*as.numeric(Sex)
})

# Calculate true ATE
with(hec, mean(Y1 - Y0))

## ----echo=TRUE, results="hide"-------------------------------------------
library(randomizr)
Z <- simple_ra(N = N)
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- simple_ra(N = N, prob = 0.30)
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- simple_ra(N = N, num_arms = 3)
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- simple_ra(N = N, prob_each = c(.2, .2, .6))
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- simple_ra(N = N, prob_each = c(.2, .2, .6),
               conditions=c("control", "placebo", "treatment"))
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- complete_ra(N = N)
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- complete_ra(N = N, m = 200)
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- complete_ra(N = N, num_arms = 3)
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- complete_ra(N = N, m_each = c(100, 200, 292))
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- complete_ra(N = N, m_each = c(100, 200, 292),
               conditions = c("control", "placebo", "treatment"))
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ------------------------------------------------------------------------
sims <- 1000

# Set up empty vectors to collect results
simple_ests <- rep(NA, sims)
complete_ests <- rep(NA, sims)

# Loop through simulation 2000 times
for(i in 1:sims){
  hec <- within(hec,{
    
    # Conduct both kinds of random assignment
    Z_simple <- simple_ra(N = N)
    Z_complete <- complete_ra(N = N)
    
    # Reveal observed potential outcomes
    Y_simple <- Y1*Z_simple + Y0*(1-Z_simple)
    Y_complete <- Y1*Z_complete + Y0*(1-Z_complete)
    })
  
  # Estimate ATE under both models
  fit_simple <- lm(Y_simple ~ Z_simple, data=hec)
  fit_complete <- lm(Y_complete ~ Z_complete, data=hec)
  
  # Save the estimates
  simple_ests[i] <- coef(fit_simple)[2]
  complete_ests[i] <- coef(fit_complete)[2]
}

## ----echo=TRUE, results="hide"-------------------------------------------
sd(simple_ests)

## ----echo=TRUE, results="hide"-------------------------------------------
sd(complete_ests)

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- block_ra(blocks = hec$Hair)
table(Z, hec$Hair)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(table(Z, hec$Hair))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- block_ra(blocks = hec$Hair, num_arms = 3)
table(Z, hec$Hair)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(table(Z, hec$Hair))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- block_ra(blocks = hec$Hair, conditions = c("Control", "Placebo", "Treatment"))
table(Z, hec$Hair)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(table(Z, hec$Hair))

## ----echo=TRUE, results="hide"-------------------------------------------
Z <- block_ra(blocks = hec$Hair, prob_each = c(.3, .7))
table(Z, hec$Hair)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(table(Z, hec$Hair))

## ----echo=TRUE, results="hide"-------------------------------------------
sort(unique(hec$Hair))
block_m_each <- rbind(c(78, 30),
                      c(186, 100),
                      c(51, 20),
                      c(87,40))

block_m_each
Z <- block_ra(blocks = hec$Hair, block_m_each = block_m_each)
table(Z, hec$Hair)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(table(Z, hec$Hair))

## ----echo=TRUE, results="hide"-------------------------------------------
declaration <- declare_ra(blocks = hec$Hair, block_m_each = block_m_each)

# show the probability that each unit is assigned to each condition
head(declaration$probabilities_matrix)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(declaration$probabilities_matrix))

## ----echo=TRUE, results="hide"-------------------------------------------
# Show that the probability of treatment is different within block
table(hec$Hair, round(declaration$probabilities_matrix[,2], 3))

## ----echo=FALSE----------------------------------------------------------
knitr::kable(table(hec$Hair, round(declaration$probabilities_matrix[,2], 3)))

## ----echo=TRUE, results="hide"-------------------------------------------
hec <- within(hec,{
  Z_blocked <- block_ra(blocks = hec$Hair,
                        block_m_each = block_m_each)
  Y_blocked <- Y1*(Z_blocked) + Y0*(1-Z_blocked)
  cond_prob <- obtain_condition_probabilities(declaration, Z_blocked)
  IPW_weights <- 1/(cond_prob)
})

fit_LSDV <- lm(Y_blocked ~ Z_blocked + Hair, data=hec)
fit_IPW <- lm(Y_blocked ~ Z_blocked, weights = IPW_weights, data = hec)

summary(fit_LSDV)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(summary(fit_LSDV)$coefficients)

## ----echo=TRUE, results="hide"-------------------------------------------
summary(fit_IPW)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(summary(fit_IPW)$coefficients)

## ----echo=TRUE, results="hide"-------------------------------------------
blocks <- with(hec, paste(Hair, Eye, Sex, sep = "_"))
Z <- block_ra(blocks = blocks)
head(table(blocks, Z))

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(table(blocks, Z)))

## ----echo=TRUE, results="hide"-------------------------------------------
library(blockTools)

# BlockTools requires that all variables be numeric
numeric_mat <- model.matrix(~Hair+Eye+Sex, data=hec)[,-1]

# BlockTools also requres an id variable
df_forBT <- data.frame(id_var = 1:nrow(numeric_mat), numeric_mat)

# Conducting the actual blocking: let's make trios
out <- block(df_forBT, n.tr = 3, id.vars = "id_var", 
             block.vars = colnames(df_forBT)[-1])

# Extact the block_ids
hec$block_id <- createBlockIDs(out, df_forBT, id.var = "id_var")

# Conduct actual random assignment with randomizr
Z_blocked <- block_ra(blocks = hec$block_id, num_arms = 3)
head(table(hec$block_id, Z_blocked))

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(table(hec$block_id, Z_blocked)))

## ----echo=TRUE, results="hide"-------------------------------------------
clusters <- with(hec, paste(Hair, Eye, Sex, sep = "_"))
hec$clusters <- clusters

Z_clust <- cluster_ra(clusters = clusters)

head(table(clusters, Z_clust))

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(table(clusters, Z_clust)))

## ----echo=TRUE, results="hide"-------------------------------------------
Z_clust <- cluster_ra(clusters = clusters, num_arms = 3)
head(table(clusters, Z_clust))

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(table(clusters, Z_clust)))

## ----echo=TRUE, results="hide"-------------------------------------------
Z_clust <- cluster_ra(clusters=clusters, 
                      conditions=c("Control", "Placebo", "Treatment"))
head(table(clusters, Z_clust))

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(table(clusters, Z_clust)))

## ----echo=TRUE, results="hide"-------------------------------------------
Z_clust <- cluster_ra(clusters=clusters, m_each=c(5, 15, 12))
head(table(clusters, Z_clust))

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(table(clusters, Z_clust)))

## ----echo=TRUE, results="hide", message="hide"---------------------------
suppressMessages(library(dplyr))
cluster_level_df <- 
  hec %>%
  group_by(clusters) %>%
  summarize(cluster_size = n()) %>%
  arrange(cluster_size) %>%
  mutate(blocks = paste0("block_", sprintf("%02d",rep(1:16, each=2))))

hec <- left_join(hec, cluster_level_df)

# Extract the cluster and block variables
clusters <- hec$clusters
blocks <- hec$blocks

Z <- block_and_cluster_ra(clusters = clusters, blocks = blocks)
head(table(clusters, Z))
head(table(blocks, Z))

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(table(clusters, Z_clust)))
knitr::kable(head(table(blocks, Z_clust)))

## ----echo=TRUE, results="hide"-------------------------------------------
block_m_each <- 
  rbind(c(78, 30),
        c(186, 100),
        c(51, 20),
        c(87, 40))
  
Z <- block_ra(blocks = hec$Hair,
              block_m_each = block_m_each)

table(hec$Hair, Z)

## ----echo=FALSE----------------------------------------------------------
junk = table(hec$Hair, Z)
junk[, 1] = round(junk[, 1], 2)

knitr::kable(table(hec$Hair, Z))

## ----echo=TRUE, results="hide"-------------------------------------------
declaration <- declare_ra(blocks = hec$Hair,
                          block_m_each = block_m_each)
prob_mat <- declaration$probabilities_matrix
head(prob_mat)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(prob_mat))

## ----echo=TRUE, results="hide"-------------------------------------------
cond_prob <- obtain_condition_probabilities(declaration, Z)
table(cond_prob, Z)

## ----echo=FALSE----------------------------------------------------------
# Hack to override that the digits parameter won't work because table sets rownames
# to a character vector version of the numbers before output.
junk = table(cond_prob, Z)
rownames(junk) = as.character(round(as.numeric(rownames(junk)), 2))
knitr::kable(junk)

## ----echo=TRUE, results="hide"-------------------------------------------
# 400 families have 1 child in the lottery, 100 families have 2
family_id <- c(sprintf("%03d", 1:500), sprintf("%03d", 1:100))

school_ra <- function(m){
  N <- length(family_id)
  random_number <- sample(1:N, replace=FALSE)
  Z <- rep(0, N)
  i <- 1
  while(sum(Z) <m){
    Z[family_id==family_id[random_number[i]]] <- 1
    i <- i + 1
  }
  return(Z)
}

Z <- school_ra(200)
table(Z)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(t(as.matrix(table(Z))))

## ------------------------------------------------------------------------
Z_matrix <- replicate(1000, school_ra(200))
plot(rowMeans(Z_matrix))

## ----eval=FALSE----------------------------------------------------------
#  hec <- within(hec,{
#    Z_blocked <- complete_ra(N = N, m_each = c(100, 200, 292),
#                 conditions = c("control", "placebo", "treatment"))
#    id_var <- 1:nrow(hec)
#  })
#  write.csv(hec[,c("id_var", "Z_blocked")], file = "MyRandomAssignment.csv")

