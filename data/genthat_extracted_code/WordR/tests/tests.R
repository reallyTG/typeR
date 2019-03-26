
test_that("Rendering inline code", {
  expect_equal(renderInlineCode(
    paste(examplePath(),'templates/template1.docx',sep = '/'),
    paste(tempdir(),'/result1.docx',sep = '/'),debug=F),
    paste(tempdir(),'/result1.docx',sep = '/'))
})

test_that("body_add_flextables", {
  expect_equal({
       library(flextable)
       ft_mtcars <- flextable(mtcars)
       ft_iris <- flextable(iris)
       FT <- list(ft_mtcars=ft_mtcars,ft_iris=ft_iris)
       body_add_flextables(
       paste(examplePath(),'templates/templateFT.docx',sep = ''),
       paste(tempdir(),'/resultFT.docx',sep = ''),
       FT)
  },
  paste(tempdir(),'/resultFT.docx',sep = ''))
})

test_that("addPlots", {
  expect_equal({library(ggplot2);Plots<-list(plot1=function()plot(hp~wt,data=mtcars,col=cyl),plot2=function()print(ggplot(mtcars,aes(x=wt,y=hp,col=as.factor(cyl)))+geom_point()));
  addPlots(
    paste(examplePath(),'templates/templatePlots.docx',sep = ''),
    paste(tempdir(),'/resultPlots.docx',sep = ''),
    Plots,debug=F,height=4)},
  paste(tempdir(),'/resultPlots.docx',sep = ''))
})
