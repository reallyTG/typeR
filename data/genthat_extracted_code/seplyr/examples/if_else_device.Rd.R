library(seplyr)


### Name: if_else_device
### Title: Simulate a per-row block-'if(){}else{}'.
### Aliases: if_else_device

### ** Examples


 suppressPackageStartupMessages(library("dplyr"))
 # Example: clear one of a or b in any row where both are set.
 d <- data.frame(a = c(0, 0, 1, 1, 1, 1, 1, 1, 1, 1),
                 b = c(0, 1, 0, 1, 1, 1, 1, 1, 1, 1),
                 edited = FALSE)

 program <- if_else_device(
   testexpr = '(a+b)>1',
   thenexprs = c(
     if_else_device(
       testexpr = 'runif(n()) >= 0.5',
       thenexprs = 'a' := '0',
       elseexprs = 'b' := '0'),
     'edited' := 'TRUE'))
 print(program)

 plan <- partition_mutate_se(program)
 print(plan)

 res <- d %.>%
   mutate_seb(., plan) %.>%
   select_se(., grepdf('^ifebtest_.*', ., invert=TRUE))
 print(res)

 ## Note: with wrapr version 1.0.2 or greater
 ## you can write this without quotes code as:
 # program <- if_else_device(
 #  testexpr = qe((a+b)>1),
 #  thenexprs = c(
 #    if_else_device(
 #      testexpr = qe(runif(n()) >= 0.5),
 #      thenexprs = qae(a := 0),
 #      elseexprs = qae(b := 0)),
 #    qae(edited := TRUE)))




