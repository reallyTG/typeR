library(rqdatatable)


### Name: ex_data_table.relop_theta_join
### Title: Theta join (database implementation).
### Aliases: ex_data_table.relop_theta_join

### ** Examples


 d1 <- data.frame(AUC = 0.6, R2 = 0.2)
 d2 <- data.frame(AUC2 = 0.4, R2 = 0.3)

 optree <- theta_join_se(local_td(d1), local_td(d2), "AUC >= AUC2")

 ex_data_table(optree, tables = list(d1 = d1, d2 = d2)) %.>%
   print(.)




