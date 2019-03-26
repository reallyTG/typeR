## ----chpkg---------------------------------------------------------------
run_vignette <- requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)

## ----ex1, comment="", eval=run_vignette----------------------------------
library("rquery")

# example data
set.seed(3463)
d <- data.frame(id = seq_len(4))
for(group in c('a', 'b', 'c', 'd', 'e')) {
  d[[paste0("rand_", group)]] <- runif(nrow(d))
}
my_db <- DBI::dbConnect(RSQLite::SQLite(), 
                        ":memory:")
d1 <- rq_copy_to(my_db, "example_table", d)
d1 %.>%
  to_sql(., my_db) %.>%
  DBI::dbGetQuery(my_db, .) %.>%
  knitr::kable(.)

# design the experiment 
plan <- d1 %.>%
  extend(.,
   choice_a = rand_a>=0.5, 
    a_1 = ifelse(choice_a, 
                  'T', 
                  'C'),
    a_2 = ifelse(choice_a, 
                  'C', 
                  'T'),
   choice_b = rand_b>=0.5, 
    b_1 = ifelse(choice_b, 
                  'T', 
                  'C'),
    b_2 = ifelse(choice_b, 
                  'C', 
                  'T'),
   choice_c = rand_c>=0.5, 
    c_1 = ifelse(choice_c, 
                  'T', 
                  'C'),
    c_2 = ifelse(choice_c, 
                  'C', 
                  'T'),
   choice_d = rand_d>=0.5, 
    d_1 = ifelse(choice_d, 
                  'T', 
                  'C'),
    d_2 = ifelse(choice_d, 
                  'C', 
                  'T'),
   choice_e = rand_e>=0.5, 
    e_1 = ifelse(choice_e, 
                  'T', 
                  'C'),
    e_2 = ifelse(choice_e, 
                  'C', 
                  'T')
  ) %.>%
  select_columns(., 
                 qc(id,
                    a_1, a_2, b_1, b_2,
                    c_1, c_2, d_1, d_2,
                    e_1, e_2))

cat(format(plan))

## ----sql1, comment="", eval=run_vignette---------------------------------
sql <- to_sql(plan, my_db)
cat(sql)

## ----exec1, eval=run_vignette--------------------------------------------
DBI::dbGetQuery(my_db, sql) %.>%
  knitr::kable(.)

## ----reuse, comment="", eval=run_vignette--------------------------------
plan2 <- d1 %.>%
  extend(.,
   choice = rand_a>=0.5, 
    a_1 = ifelse(choice, 
                  'T', 
                  'C'),
    a_2 = ifelse(choice, 
                  'C', 
                  'T'),
   choice = rand_b>=0.5, 
    b_1 = ifelse(choice, 
                  'T', 
                  'C'),
    b_2 = ifelse(choice, 
                  'C', 
                  'T'),
   choice = rand_c>=0.5, 
    c_1 = ifelse(choice, 
                  'T', 
                  'C'),
    c_2 = ifelse(choice, 
                  'C', 
                  'T'),
   choice = rand_d>=0.5, 
    d_1 = ifelse(choice, 
                  'T', 
                  'C'),
    d_2 = ifelse(choice, 
                  'C', 
                  'T'),
   choice = rand_e>=0.5, 
    e_1 = ifelse(choice, 
                  'T', 
                  'C'),
    e_2 = ifelse(choice, 
                  'C', 
                  'T')
  ) %.>%
  select_columns(., 
                 qc(id,
                    a_1, a_2, b_1, b_2,
                    c_1, c_2, d_1, d_2,
                    e_1, e_2))

cat(format(plan2))

## ----exec2, eval=run_vignette--------------------------------------------
sql2 <- to_sql(plan2, my_db)
DBI::dbGetQuery(my_db, sql2) %.>%
  knitr::kable(.)

## ----cleanup, eval=run_vignette------------------------------------------
DBI::dbDisconnect(my_db)

