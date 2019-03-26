context("rbind_rakelist")

data("dog_pubs")

test_that("rbind_rakelist works when no doc_ids are given", {
  rakelist <- slowrake(dog_pubs$abstract[1:3])
  out_rbind <- rbind_rakelist(rakelist)
  expect_type(out_rbind, "list")
})

test_that("rbind_rakelist works when doc_ids are given", {
  rakelist <- slowrake(dog_pubs$abstract[1:3])
  doc_id <- c("i", "love", "dogs")
  out_rbind <- rbind_rakelist(rakelist, doc_id = doc_id)
  expect_true(all(doc_id == unique(out_rbind$doc_id)))
})