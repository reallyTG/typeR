# ==============================================================================
# quickmatch -- Quick Generalized Full Matching
# https://github.com/fsavje/quickmatch
#
# Copyright (C) 2018 Fredrik Savje -- http://fredriksavje.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see http://www.gnu.org/licenses/
# ==============================================================================

library(quickmatch)
context("covariate_averages")

cov <- matrix(c(0.0205, -0.3570, -0.1800,  1.6027,  0.6040,  0.0446,  1.1410,  0.6459,  0.2176,  1.0053,  0.8606, -1.6118,  0.5874,  1.1100,
                -1.3736, -0.0285,  0.3507,  0.7171, -1.3828,  0.8234, -0.7631, -0.4639, -0.4376,  0.0730,  0.1047, -0.5083, -0.2196,  0.5361, -1.5352,
                -0.8881, -0.8442,  0.0563, -1.5486, -0.5264, -0.8658,  1.5356,  0.2647, -0.0963,  0.4131, -1.1494, -1.9345, -0.5645,  1.1416,  0.0773,
                -0.5720,  0.5793, -0.3981, -0.9894, -1.2676, -0.6354, -0.1311, -0.1716,  0.7746,  1.6090,  2.8755, -0.2764,  0.7829,  0.4025, -0.2133,
                0.2556, -0.2961,  0.1277, -1.1842,  0.5236,  1.2570, -0.3152,  0.2932, -1.0783, -0.3862, -0.8232, -1.1835, -1.3552, -0.0789, -0.0066,
                0.3635,  0.5077,  1.2753, -0.8967,  0.4159, -0.7981,  0.2287, -0.4356, -0.7993, -0.2827, -0.7846,  1.2104,  1.0357, -1.5568,  2.3634,
                -0.1235, -0.6127, -1.2388,  1.3979, -0.2042,  0.5417,  1.1585,  0.1019, -0.4110,  1.7379,  1.0779,  0.4450,  3.2147,  1.0197,  1.3007,
                -0.1291,  0.9400,  0.4611,  1.3303,  0.1158,  0.1236,  1.6459, -0.3607,  0.5939, -0.3914, -0.0605, -1.0023,  1.6778,  0.6189, -0.9104,
                -1.5664, -0.8702,  0.7727, -1.0583, -0.7396,  0.5931, -0.6804,  2.3084, -0.1429,  2.4170,  1.5413,  0.8579, -0.2773,  0.5879,  0.7498,
                0.1557,  0.3880,  0.4225, -1.1402,  1.7665,  0.4245, -0.3918,  0.4971,  0.7368, -0.9356,  0.4586,  1.7515,  1.2829,  0.2030, -0.6820,
                0.0969, -1.0878,  0.0772,  2.5644, -0.3377,  1.1355, -0.6275, -0.3647,  0.1621, -0.1468,  1.6987, -0.8734, -0.9340,  0.5531,  1.4509,
                -0.3212, -1.2277,  0.6314,  0.9667, -1.6311,  0.3286, -1.9934, -1.6888,  0.3473,  0.6372,  0.3762, -0.0419, -0.7407, -1.2121,  0.7571,
                -0.5526,  0.1421,  0.1362, -0.2806,  0.0616, -1.2681, -0.4562, -0.7822,  1.4473, -0.9530,  0.4526, -1.1236,  1.0511, -0.8775,  0.1029,
                -1.4251, -1.2171,  0.3472, -0.2190,  0.0336,  0.1680,  0.1281, -1.9779,  0.1375,  1.8399, -0.0493,  0.6907,  0.7541,  0.5287, -0.8845,
                1.4811,  0.3286,  0.8972,  0.5654,  0.8593, -0.1344,  0.8320, -0.8736, -0.7748,  0.6392, -1.1989,  0.3728, -0.4211, -0.3649, -0.4534,
                -0.0137,  0.3928,  1.2608,  1.2502,  0.3193,  1.1112, -1.8545,  0.5773,  0.2744,  0.0725,  0.2167, -0.7172, -0.7628,  0.8344, -0.2046,
                1.0611,  1.2770, -1.6743,  1.3876, -0.4273,  0.4789, -0.8904, -2.2173,  0.6997, -1.8759,  0.7042, -0.2366, -0.8236, -0.5462,  1.8462,
                0.5542, -0.9172, -2.1855, -0.6027, -2.0782,  0.5249,  1.9438,  0.4261, -0.2575, -2.7734, -0.7753,  0.0163, -0.8262, -1.6110, -0.1041,
                -0.7182,  0.3477,  1.3551, -0.2285, -0.9560, -0.8441,  1.2757, -0.9876,  1.0534, -0.9341, -0.3950, -2.2642, -0.4673, -1.2123, -1.0671,
                1.0994, -1.0178,  1.1849,  1.9378, -0.1527, -0.8706,  0.2871,  0.9813, -0.2128,  1.7363, -0.2256,  1.3844, -0.5083,  0.0575, -0.2202,
                -2.0043,  0.3946,  0.8989,  0.5002,  0.9511,  1.1091,  0.7113,  1.3659, -0.0582,  1.6949, -0.7345, -0.6111, -0.5422, -2.6116, -0.9190,
                0.4477,  1.2454,  1.2049, -0.2520,  0.5938,  0.4758,  0.1826, -1.1340,  0.4525,  0.1237, -0.7409, -0.8201,  0.1525,  0.2695, -1.5823,
                -1.2049,  0.9168,  0.0510, -0.3695, -0.4639, -0.4096,  0.9551, -0.6061, -0.7474,  0.8266,  2.0093,  0.7526,  1.4513, -0.3172,  0.0437,
                1.9979,  1.0427, -0.3827, -0.3352, -0.7851,  0.7902, -0.8383, -0.1463,  1.7544, -0.6223,  0.5491,  1.0549, -1.2745,  0.6006,  1.0724,
                1.7022, -1.4415,  1.3337,  1.4286,  0.1131,  0.6909, -0.3527,  1.0276, -1.7789, -2.3209,  0.4760,  0.2717, -1.4556, -0.2188, -0.7969,
                1.1241,  1.6584,  0.1295, -0.0227,  0.3267, -1.7511,  0.1707, -0.0164, -0.6512,  1.3965,  0.1340,  0.3256, -0.5760,  0.0319,  0.3296,
                -0.8830,  0.5726, -1.5751, -0.7329, -0.7542, -0.7859, -0.3914, -0.2288,  1.5780, -1.7739,  0.0440, -0.0925, -1.8832,  1.3091,  0.2592,
                1.8375, -1.5061,  1.4029, -1.0109,  1.1734, -0.6569, -0.7112, -2.3794,  0.7054,  1.5654,  0.8891,  0.0091, -0.6947,  1.4746,  0.7423,
                -1.7094, -0.3652, -0.8040, -0.0838, -0.0832, -0.7429, -0.1221, -0.2304,  0.3326, -0.2007,  0.7618,  0.6339,  1.0916,  0.2606,  1.9462,
                -0.0962, -0.0238,  0.3406, -0.4235,  1.5965, -1.3173, -0.5833,  0.9931, -0.6504, -1.6696, -0.1766, -0.0618,  0.9042, -1.8983, -0.7147,
                0.0607, -0.3663, -0.3427,  0.0150,  2.0077, -1.5831, -1.1572, -2.3661,  0.5794,  0.3421, -1.2125,  2.0121, -0.2505,  1.0036,  2.1437,
                -1.5260,  0.6540,  0.5038, -0.1488,  0.3597,  0.3622,  0.9767, -0.3947, -0.5022,  0.5277, -0.7256, -1.8513, -2.3371,  1.2231, -0.6757,
                0.0961, -0.5849, -0.2429,  0.5242,  0.7977, -0.2923,  0.4917, -0.6212, -2.3871, -2.0155, -1.1342,  0.3785, -0.2179, -0.0241, -0.1828,
                0.8068, -0.0506, -0.8762, -1.3112,  0.6008,  1.5089), ncol = 5)

treatment1 <- c("B", "A", "A", "A", "A", "A", "B", "A", "B", "A", "B", "B", "A", "B", "A", "A", "B", "A", "B", "A", "A", "A", "A", "B", "A",
                "A", "B", "A", "B", "B", "A", "A", "A", "A", "A", "B", "A", "A", "A", "A", "A", "B", "B", "A", "A", "A", "B", "A", "A", "B",
                "B", "B", "B", "B", "A", "A", "A", "B", "A", "B", "B", "A", "A", "A", "B", "B", "B", "B", "A", "A", "B", "B", "B", "A", "A",
                "B", "B", "A", "B", "A", "A", "B", "B", "B", "B", "A", "A", "B", "B", "B", "B", "B", "A", "B", "B", "A", "A", "B", "B", "B")

treatment2 <- c("B", "A", "A", "A", "A", "A", "B", "A", "B", "A", "B", "B", "A", "B", "A", "A", "B", "A", "B", "A", "A", "A", "A", "B", "A",
                "A", "C", "A", "A", "C", "A", "A", "A", "A", "A", "C", "C", "A", "A", "C", "C", "A", "C", "C", "A", "C", "C", "C", "A", "A",
                "B", "A", "B", "A", "B", "B", "A", "A", "A", "A", "A", "B", "A", "A", "A", "A", "A", "B", "B", "A", "A", "A", "B", "A", "A",
                "C", "C", "C", "C", "A", "A", "A", "C", "A", "C", "C", "A", "A", "A", "C", "C", "C", "C", "A", "A", "C", "C", "C", "A", "A")


replica_covariate_averages <- function(treatments,
                                       covariates,
                                       matching,
                                       target = NULL) {
  treatments <- coerce_treatments(treatments)
  num_observations <- length(treatments)
  covariates <- coerce_covariates(covariates, num_observations)
  if (is.null(covariates)) stop("`covariates` is NULL.")
  ensure_matching(matching, num_observations)
  target <- coerce_target(target, treatments)
  if (is.null(target)) {
    target <- rep(TRUE, num_observations)
  } else {
    target <- 1:num_observations %in% target
  }

  target_weight <- sapply(split(target, matching), sum) / sum(target)

  cov_tr_mean <- t(apply(covariates, 2, function(cov) {
    sapply(levels(treatments), function(treat) {
      sum(target_weight * sapply(split(cov[treatments == treat], matching[treatments == treat]), mean))
    })
  }))

  group_need <- sapply(split(target, matching), sum)
  group_need <- names(group_need[group_need > 0])

  group_miss <- sapply(levels(treatments), function(treat) {
    all(group_need %in% names(sapply(split(matching[treatments == treat], matching[treatments == treat]), length)))
  })

  cov_tr_mean[, !group_miss] <- NA

  cov_tr_mean
}

test_matching <- qm_matching(rep("A", 100))

test_that("`covariate_averages` no matching", {
  expect_equal(covariate_averages(treatment1, cov),
               replica_covariate_averages(treatment1, cov, test_matching))
  expect_equal(covariate_averages(treatment2, cov),
               replica_covariate_averages(treatment2, cov, test_matching))
  expect_equal(covariate_averages(treatment1, cov[, 1]),
               replica_covariate_averages(treatment1, cov[, 1], test_matching))
  expect_equal(covariate_averages(treatment2, cov[, 1]),
               replica_covariate_averages(treatment2, cov[, 1], test_matching))
  expect_equal(covariate_averages(treatment1, cov[, 2]),
               replica_covariate_averages(treatment1, cov[, 2], test_matching))
  expect_equal(covariate_averages(treatment2, cov[, 2]),
               replica_covariate_averages(treatment2, cov[, 2], test_matching))
})


test_matching <- quickmatch(distances(cov), treatment1)

test_that("`covariate_averages` matching 1", {
  expect_equal(covariate_averages(treatment1, cov, test_matching),
               replica_covariate_averages(treatment1, cov, test_matching))
})


test_matching <- quickmatch(distances(cov), treatment2)

test_that("`covariate_averages` matching 2", {
  expect_equal(covariate_averages(treatment2, cov, test_matching),
               replica_covariate_averages(treatment2, cov, test_matching))
})


test_matching <- quickmatch(distances(cov), treatment1)
target_logical <- (treatment1 == "B")
target_indices <- which(target_logical)
target_indices_mix <- c(rev(target_indices[11:length(target_indices)]), target_indices[1:10])

test_that("`covariate_averages` matching 1", {
  expect_equal(covariate_averages(treatment1, cov, test_matching, target = "B"),
               replica_covariate_averages(treatment1, cov, test_matching, target = "B"))
  expect_equal(covariate_averages(treatment1, cov, test_matching, target = target_logical),
               replica_covariate_averages(treatment1, cov, test_matching, target = "B"))
  expect_equal(covariate_averages(treatment1, cov, test_matching, target = target_indices),
               replica_covariate_averages(treatment1, cov, test_matching, target = "B"))
  expect_equal(covariate_averages(treatment1, cov, test_matching, target = target_indices_mix),
               replica_covariate_averages(treatment1, cov, test_matching, target = "B"))
})


test_matching <- quickmatch(distances(cov), treatment2, target = "A")

test_that("`covariate_averages` matching 2", {
  expect_equal(covariate_averages(treatment2, cov, test_matching, target = "A"),
               replica_covariate_averages(treatment2, cov, test_matching, target = "A"))
})


test_matching <- quickmatch(distances(cov), treatment2, target = "A", secondary_unassigned_method = "ignore")

test_that("`covariate_averages` matching 2", {
  expect_equal(covariate_averages(treatment2, cov, test_matching, target = "A"),
               replica_covariate_averages(treatment2, cov, test_matching, target = "A"))
})


test_matching <- quickmatch(distances(cov), treatment2, treatment_constraints = c("A" = 1L, "B" = 1L))

test_that("`covariate_averages` matching 2", {
  expect_warning(covariate_averages(treatment2, cov, test_matching),
                 regexp = "Some matched groups are missing treatment conditions. Corresponding balance measures cannot be derived.")
  expect_warning(expect_equal(covariate_averages(treatment2, cov, test_matching),
                              replica_covariate_averages(treatment2, cov, test_matching)))
})
