library(gvcR)


### Name: gvc_herit
### Title: Heritability
### Aliases: gvc_herit

### ** Examples


set.seed(12345)
Response <- c(
               rnorm(48, mean = 15000, sd = 500)
             , rnorm(48, mean =  5000, sd = 500)
             , rnorm(48, mean =  1000, sd = 500)
             )
Rep      <- as.factor(rep(1:3, each = 48))
Variety  <- gl(n = 4, k =  4, length = 144, labels = letters[1:4])
Env      <- gl(n = 3, k = 16, length = 144, labels = letters[1:3])
df1      <- data.frame(Response, Rep, Variety, Env)

# Heritability
herit <-
  gvc_herit(
           y    = Response
         , rep  = Rep
         , geno = Variety
         , env  = Env
         , data = df1
         )
herit

library(eda4treeR)
data(DataExam6.2)
herit <-
  gvc_herit(
           y    = Dbh.mean
         , rep  = Replication
         , geno = Family
         , env  = Province
         , data = DataExam6.2
         )
herit



