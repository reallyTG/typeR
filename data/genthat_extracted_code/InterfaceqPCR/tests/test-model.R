
# test the model
context('model lm')

test_that('model lm', {
  ordonne<-c(1:6)
  abscisse<-c(4:9)
  model<-lm(ordonne~abscisse)
  expect_is(model, "lm" )
})

