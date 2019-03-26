test_that("facebook.S4.posts", {
  
  skip_on_cran()

  setwd("../../")
  if(!file.exists("./.httr-oauth")) skip("Cannot authenticate. Skipping...")
  
  app.key <- Sys.getenv("FACEBOOK_CONNECTOR_APP", "")
  app.secret <- Sys.getenv("FACEBOOK_CONNECTOR_SECRET", "")
  
  fb_token <- fbOAuth(app.key, app.secret)
  
  pages <- FacebookPagesCollection("9thcirclegames,linuspage", fb_token)
  
  posts <- FacebookPostsCollection(pages, fb_token, n = 10)
  
  # Check for data types
  expect_is(posts, "FacebookPostsCollection")
  expect_is(as.list(posts), "list")
  expect_is(as.data.frame(posts), "data.frame")
  
  # Output list has 2 elements
  expect_equal(length(posts), length(pages)*10)
  
  # Default fields are named as expected
  expect_identical(posts@fields, c("id",
                                   "from",
                                   "message",
                                   "created_time",
                                   "type",
                                   "link",
                                   "name",
                                   "comments",
                                   "likes"))
  
  expect_is(posts@parent.collection, "FacebookPagesCollection")
  expect_equal(posts@type, rep(as.character(NA), length(posts)))
  expect_equal(length(posts@parent.collection), length(pages))
  
  # Shared Posts
  shared <- FacebookPostsCollection(posts)
  expect_is(shared@parent.collection, "FacebookPostsCollection")
  expect_equal(length(shared@parent.collection), length(posts))

  # Build from users
  me.posts <- FacebookPostsCollection(FacebookUsersCollection("me", fb_token, fields = ""))
  
  # Build from atomic
  expect_is(FacebookPostsCollection("143384179038404_900880349955446", fb_token), "FacebookPostsCollection")
  
  atomics <- FacebookPostsCollection(posts@id, fb_token)
  expect_is(atomics, "FacebookPostsCollection")
  expect_null(atomics@parent.collection)
  
  expect_is(me.posts@parent.collection, "FacebookUsersCollection")
  expect_equal(length(me.posts@parent.collection@id), 1)

  # Errors
  expect_error(FacebookPostsCollection(me.posts, fb_toke, fields="blahblah"))
  
  # Clean the environment
  rm(list = ls())
  
})