test_that("facebook.S4.likes", {
  
  skip_on_cran()

  setwd("../../")
  if(!file.exists("./.httr-oauth")) skip("Cannot authenticate. Skipping...")
  
  app.key <- Sys.getenv("FACEBOOK_CONNECTOR_APP", "")
  app.secret <- Sys.getenv("FACEBOOK_CONNECTOR_SECRET", "")
  
  fb_token <- fbOAuth(app.key, app.secret)
  
  pages <- FacebookPagesCollection("9thcirclegames,linuspage", fb_token)
  posts <- FacebookPostsCollection(pages, fb_token, n = 10)
  comments <- FacebookCommentsCollection(posts)
  
  likes <- FacebookLikesCollection(posts)
  likes.comments <- FacebookLikesCollection(comments)
  
  # Check for data types
  expect_is(likes, "FacebookLikesCollection")
  expect_is(as.list(likes), "list")
  expect_is(as.data.frame(likes), "data.frame")
  
  expect_is(likes@parent.collection, "FacebookPostsCollection")
  expect_is(likes.comments@parent.collection, "FacebookCommentsCollection")
  expect_is(likes@parent.collection@parent.collection, "FacebookPagesCollection")
  
  expect_is(likes@parent.collection, "FacebookCommentsCollection")
  expect_is(likes@parent.collection@parent.collection, "FacebookPostsCollection")
  
  # Clean the environment
  rm(list = ls())
  
})