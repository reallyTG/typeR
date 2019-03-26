suppressMessages(library(rENA, quietly = T, verbose = F))
context("Test making sets");
#
# #codeNames = c("E.data","S.data","E.design","S.design","S.professional","E.client","V.client","E.consultant","V.consultant","S.collaboration","I.engineer","I.intern","K.actuator","K.rom","K.materials","K.power");
codeNames = c('Data','Technical.Constraints','Performance.Parameters','Client.and.Consultant.Requests','Design.Reasoning','Collaboration');
#
test_that("Simple data.frame to accumulate and make set", {
  # df.file <- system.file("extdata", "rs.data.csv", package="rENA")
  data(RS.data)
  df.file <- RS.data
  df.accum = ena.accumulate.data.file(df.file, units.by = c("UserName","Condition"), conversations.by = c("ActivityNumber","GroupName"), codes = codeNames);
  df.set = ena.make.set(df.accum)

  testthat::expect_equal(
    label = "Used 6 codes",
    object = length(df.set$codes),
    expected = 6
  );
  testthat::expect_equal(
    label = "48 units with all dimensions",
    object = dim(df.set$points.rotated),
    expected = c(48,choose(length(codeNames),2))
  );
  testthat::expect_equal(
    label = "Has all 48 units",
    object = length(df.set$enadata$unit.names),
    expected = 48
  );
})

test_that("Test custom rotation.set", {
  # df.file <- system.file("extdata", "rs.data.csv", package="rENA")
  data(RS.data)
  df.file <- RS.data

  conversations.by = c("Condition","ActivityNumber","GroupName")
  df.accum.grps = ena.accumulate.data.file(df.file, units.by = c("GroupName","Condition"), conversations.by = conversations.by, codes = codeNames);
  df.accum.usrs = ena.accumulate.data.file(df.file, units.by = c("UserName","Condition"), conversations.by = conversations.by, codes = codeNames);

  df.set.grps = ena.make.set(df.accum.grps)
  df.set.usrs = ena.make.set(df.accum.usrs)
  df.set.grps.usrs = ena.make.set(df.accum.grps, rotation.set = df.set.usrs$rotation.set)

  expect_false(all(df.set.grps$rotation.set$rotation == df.set.grps.usrs$rotation.set$rotation))
  expect_false(all(df.set.grps$rotation.set$rotation == df.set.grps.usrs$rotation.set$rotation))

  expect_equal(df.set.usrs$rotation.set$rotation, df.set.grps.usrs$rotation.set$rotation)
  expect_equal(df.set.usrs$node.positions, df.set.grps.usrs$node.positions)

  expect_equal(df.set.grps$line.weights, df.set.grps.usrs$line.weights)
})

test_that("Test rotate by mean", {
  data(RS.data)
  df.file <- RS.data

  conversations.by = c("Condition","ActivityNumber","GroupName")
  df.accum.usrs = ena.accumulate.data.file(df.file, units.by = c("UserName","Condition"), conversations.by = conversations.by, codes = codeNames);

  set.svd = ena.make.set(df.accum.usrs)
  set.mr = ena.make.set(df.accum.usrs,
    rotation.by = ena.rotate.by.mean,
    rotation.params = list(df.accum.usrs$metadata$Condition=="FirstGame", df.accum.usrs$metadata$Condition=="SecondGame"));

  expect_equal(ncol(set.svd$rotation.set$rotation), ncol(set.mr$rotation.set$rotation))
  expect_equal(colnames(set.svd$rotation.set$rotation), colnames(set.svd$points.rotated))
  expect_equal(colnames(set.mr$rotation.set$rotation), colnames(set.mr$points.rotated))
  expect_equal("MR1", colnames(set.mr$rotation.set$rotation)[1])
  expect_equal("SVD1", colnames(set.svd$rotation.set$rotation)[1])
})



# test_that("Simple data.frame to accumulate and make set with Linderoth method(s)", {
#   df.file <- system.file("extdata", "rs.data.csv", package="rENA")
#   df.accum = ena.accumulate.data.file(df.file, units.by = c("UserName","Condition"), conversations.by = c("ActivityNumber","GroupName"), codes = codeNames);
#   df.set.lws.es = ena.make.set(df.accum, position.method = lws.positions.es)
#
#   testthat::expect_equal(
#     label = "48 units by 2 dimensions",
#     object = dim(df.set.lws.es$points.rotated),
#     expected = c(48,2)
#   );
#   testthat::expect_equal(
#     label = "48 units",
#     object = length(df.set.lws.es$enadata$unit.names),
#     expected = 48
#   );
# })
# test_that("Make a simple trajectory set", {
#   df.file <- system.file("extdata", "rs.data.csv", package="rENA")
#   df.accum = ena.accumulate.data.file(df.file, units.by = c("UserName","Condition"), conversations.by = c("ActivityNumber","GroupName"), codes = codeNames);
#   df.accum.traj = ena.accumulate.data.file(
#     df.file, units.by = c("UserName","Condition"),
#     conversations.by = c("ActivityNumber","GroupName"),
#     codes = codeNames,
#     model = "AccumulatedTrajectory",
#     trajectory.by = c("ActivityNumber")
#   );
#
#   df.set.lws = ena.make.set(df.accum.traj, node.position.method = lws.positions)
#
#   # testthat::expect_equal(
#   #   length(attr(df.set.lws$points.rotated, opts$UNIT_NAMES)[,UserName]),
#   #   517
#   # );
# })
