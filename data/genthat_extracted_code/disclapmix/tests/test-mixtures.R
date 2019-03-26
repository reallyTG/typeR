context("mixtures")

# https://bugs.r-project.org/bugzilla/show_bug.cgi?id=17494
suppressWarnings(RNGversion("3.5.0"))

data("danes")
db <- as.matrix(danes[rep(1:nrow(danes), danes$n), 1:(ncol(danes)-1)])

p1 <- db[1, ]
p2 <- db[100, ]

mix <- generate_mixture(list(p1, p2))
mix2 <- lapply(seq_along(p1), function(k) sort(unique(c(p1[k], p2[k]))))
names(mix2) <- names(p1)

test_that("generate_mixture", {
  expect_equal(mix, mix2)
})

contr_pairs <- contributor_pairs(mix)
test_that("generate_mixture", {
  expect_output(print(contr_pairs), "Mixture:
  DYS19 DYS389I DYS389II DYS390 DYS391 DYS392 DYS393 DYS437 DYS438 DYS439
1 13,14   12,13    28,29  22,23     10  11,15  13,15  14,16  10,11  11,12

Number of possible contributor pairs = 256")
})

fit <- disclapmix(db, clusters = 4L)
rnk <- rank_contributor_pairs(contr_pairs, fit)
p_p1 <- predict(fit, t(as.matrix(p1)))
p_p2 <- predict(fit, t(as.matrix(p2)))

test_that("rank_contributor_pairs", {
  expect_equal(which.min(abs(rnk$probs_person1 - p_p1)),
               which.min(abs(rnk$probs_person2 - p_p2)))
  expect_equal(get_rank(rnk, p1), get_rank(rnk, p2))
})

prt <- capture.output(print(rnk, 1L))
test_that("print.rank_contributor_pairs", {
  expect_output(cat(prt[3]), "1 13,14   12,13    28,29  22,23     10  11,15  13,15  14,16  10,11  11,12", 
                fixed = TRUE)
})

