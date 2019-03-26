context("integers")


# monotonic, sorted 
# increasing, decreasing 
# strictly,

int_strictly_increasing <- c(1:10)
int_strictly_decreasing <- c(10:1)

x123 <- c(1,2,3)
x132 <- c(1,3,2)

x213 <- c(2,1,3)
x231 <- c(2,3,1)

x312 <- c(3,1,2)
x321 <- c(3,2,1)

x1223 <- c(1,2,2,3)


test_that( "int", { 
  
  int_strictly_increasing %>% is_monotonic %>% expect_true()
  int_strictly_increasing %>% rev() %>% is_monotonic %>% expect_true()

  int_strictly_increasing %>% is_increasing() %>% expect_true()
  int_strictly_increasing %>% is_strictly_increasing() %>% expect_true()

  int_strictly_decreasing %>% is_decreasing() %>% expect_true()
  int_strictly_decreasing %>% is_strictly_decreasing() %>% expect_true()

  int_strictly_increasing %>% is_sorted %>% expect_true()
  int_strictly_decreasing %>% is_sorted %>% expect_true()
  
  int_strictly_increasing %>% monotonicity() %>% expect_equal(2)
  int_strictly_decreasing %>% monotonicity() %>% expect_equal(-2)
  
})


context("strict")

x1223 <- c(1,2,2,3)

test_that( "testing is_strictly_* functions", { 
  
  x1223 %>% is_monotonic() %>% expect_true()
  x1223 %>% is_strictly_monotonic() %>% expect_false()
  
  x1223 %>% is_increasing() %>% expect_true()
  x1223 %>% is_strictly_increasing() %>% expect_false()

  x1223 %>% is_decreasing() %>% expect_false()
  x1223 %>% is_strictly_decreasing() %>% expect_false() 

  x1223 %>% is_sorted() %>% expect_true()
  x1223 %>% is_strictly_sorted() %>% expect_false() 
  
})

