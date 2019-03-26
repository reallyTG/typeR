context("Epi subsetting methods OK")





test_that("[.Epi exists and works", {
  
  xcoh <- structure( list( id = c("A", "B", "C"),
                           birth = c("14/07/1952", "01/04/1954", "10/06/1987"),
                           entry = c("04/08/1965", "08/09/1972", "23/12/1991"),
                           exit = c("27/06/1997", "23/05/1995", "24/07/1998"),
                           fail = c(1, 0, 1) ),
                     .Names = c("id", "birth", "entry", "exit", "fail"),
                     row.names = c("1", "2", "3"),
                     class = "data.frame" )
  
  
  xcoh <- cal.yr( xcoh, format="%d/%m/%Y", wh=2:4 )
  
  Lcoh <- Lexis( entry = list( per=entry ),
                 exit = list( per=exit, age=exit-birth ),
                 exit.status = fail,
                 entry.status = 0,
                 data = xcoh )
  
  e1 <- subset(Lcoh, fail == 1)
  e2 <- Lcoh[Lcoh$fail == 1, ]

  expect_identical(e1, e2)
})




