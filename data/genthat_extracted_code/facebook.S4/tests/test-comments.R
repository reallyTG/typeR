test_that("facebook.S4.comments", {
  
  skip_on_cran()

  setwd("../../")
  if(!file.exists("./.httr-oauth")) skip("Cannot authenticate. Skipping...")
  
  app.key <- Sys.getenv("FACEBOOK_CONNECTOR_APP", "")
  app.secret <- Sys.getenv("FACEBOOK_CONNECTOR_SECRET", "")
  
  fb_token <- fbOAuth(app.key, app.secret)
  
  pages <- FacebookPagesCollection("9thcirclegames,linuspage", fb_token)
  
  posts <- FacebookPostsCollection(pages, fb_token, n = 10)
  
  comments <- FacebookCommentsCollection(posts)
  
  # Check for data types
  expect_is(comments, "FacebookCommentsCollection")
  expect_is(as.list(comments), "list")
  expect_is(as.data.frame(comments), "data.frame")
  
  expect_is(comments@parent.collection, "FacebookPostsCollection")
  expect_is(comments@parent.collection@parent.collection, "FacebookPagesCollection")
  
  expect_equal(comments@type, rep(as.character(NA), length(comments)))
  expect_equal(length(comments@parent.collection), length(postss))
  
  # Replies
  replies <- FacebookCommentsCollection(comments)
  expect_is(replies@parent.collection, "FacebookCommentsCollection")
  expect_equal(length(replies@parent.collection), length(comments))

  # Clean the environment
  rm(list = ls())
  
})