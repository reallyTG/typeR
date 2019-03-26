# suppressMessages(library(rENA, quietly = T, verbose = F))
# context("Test plotting sets");
#
#
# df.file <- system.file("extdata", "rs.data.csv", package="rENA")
# # codeNames = c("E.data","S.data","E.design","S.design","S.professional","E.client","V.client","E.consultant","V.consultant","S.collaboration","I.engineer","I.intern","K.actuator","K.rom","K.materials","K.power");
# codeNames = c('Data','Technical.Constraints','Performance.Parameters','Client.and.Consultant.Requests','Design.Reasoning','Collaboration');
#
# df.accum = ena.accumulate.data.file(
#   df.file,
#   units.by = c("UserName","Condition"),
#   conversations.by = c("ActivityNumber","GroupName"),
#   codes = codeNames, window.size.back = 4
# );
# df.set.lws = ena.make.set(df.accum, position.method = lws.positions.es);
#
# file = read.csv(df.file)
# accum = ena.accumulate.data(
#   units = file[,c("UserName","Condition")],
#   conversation = file[,c("Condition","GroupName")],
#   metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#   codes = file[,codeNames],
#   window.size.back = 4
# );
# Rset = ena.make.set(
#   enadata = accum,
#   rotation.by = ena.rotate.by.mean,
#   rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame")
# )
#
# ##### TESTING PLOT.GROUP
# group1.points = df.set.lws$points.rotated[df.set.lws$enadata$units$Condition == "FirstGame",]
#
# ##### FOR TESTING ALREADY MEANED GROUP
# #group.points = colMeans(group.points)
# #group.points = data.frame("V1" = group.points[1], "V2" = group.points[2])
#
# df.plot <- ena.plot(df.set.lws);
# df.plot = ena.plot.points(df.plot, points = data.frame(group1.points));
# df.plot = ena.plot.group(df.plot, group1.points, color = "blue", labels = "First Game Mean");
#
#
# #####
#
# df.accum.traj = ena.accumulate.data.file(
#   df.file,
#   units.by = c("UserName","Condition"),
#   conversations.by = c("ActivityNumber"),
#   codes = codeNames,
#   model = "A"
# );
# accum.traj = ena.accumulate.data(
#   units = file[,c("UserName","Condition")],
#   conversation = file[,c("GroupName","ActivityNumber")],
#   metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#   codes = file[,codeNames],
#   window.size.back = 4,
#   model = "A"
# );
# set.traj = ena.make.set(accum.traj);
#
# test_that("Plot all units in set", {
#   p <- ena.plot(df.set.lws) %>% ena.plot.points(df.set.lws$points.rotated)
#
#   # testthat::expect_is(p, "plotly");
# })
#
# test_that("Plot only some units, sampled from centered data", {
#   p.color <- ena.plot(df.set.lws);
#   p.color = ena.plot.points(p.color, points = df.set.lws$points.rotated, color = "yellow");
#   p.color = ena.plot.points(p.color, points = df.set.lws$points.rotated, color = "green");
#
#   # testthat::expect_is(p, "plotly");
# })
#
# test_that("Plot a trajectory set", {
#   akashv.traj.rows = set.traj$enadata$units$UserName=="akash v"
#
#   p.traj.user = ena.plot(set.traj) %>% ena.plot.trajectory(
#     points = set.traj$points.rotated[akashv.traj.rows,],
#     names = c("akash v")
#   );
#
#   #cbind(set.traj$points.rotated[akashv.traj.rows,1],
#   #df.set.traj.lws$enadata$trajectories$step$ActivityNumber[akashv.traj.rows])
#   ena.plot(set.traj) %>% ena.plot.trajectory(
#     points = cbind(set.traj$points.rotated[akashv.traj.rows,1],
#                    set.traj$enadata$trajectories$step$ActivityNumber[akashv.traj.rows]),
#     names = c("akash v")
#   );
#
#   set = set.traj
#   unitNames = set$enadata$units
#
#   first.game = unitNames$Condition == "FirstGame"
#   first.game.points = set$points.rotated[first.game,]
#
#   ### Subset rotated points and plot Condition 2 Group Mean
#   second.game = unitNames$Condition == "SecondGame"
#   second.game.points = set$points.rotated[second.game,]
#
#   #first.game.mean = colMeans( first.game.points )
#   #second.game.mean = colMeans( second.game.points )
#
#   #first.game.ci = t.test(first.game.points, conf.level = 0.95)$conf.int
#   #second.game.ci = t.test(second.game.points, conf.level = 0.95)$conf.int
#
#   ### get mean network plots
#   first.game.lineweights = set$line.weights[first.game,]
#   first.game.mean = colMeans(first.game.lineweights)
#
#   second.game.lineweights = set$line.weights[second.game,]
#   second.game.mean = colMeans(second.game.lineweights)
#
#   subtracted.network = first.game.mean - second.game.mean
#
#   dim.by.activity = cbind(
#     set$points.rotated[,1],
#     set$enadata$trajectories$step$ActivityNumber*.8/14-.4  #scale down to dimension 1
#   );
#
#   plot = ena.plot(set)
#   plot = ena.plot.network(plot, network = subtracted.network, legend.name="Network")
#   plot = ena.plot.trajectory(
#     plot,
#     points = dim.by.activity,
#     names = unique(set$enadata$units$UserName),
#     by = set$enadata$units$UserName
#   );
# });
#
# # test_that("Plot a network", {
#   # p = ena.plot.set(
#   #   df.set.lws,
#   #   plot.mode="network",
#   #   network.one="brandon f.SecondGame"
#   # );
#
#   # testthat::expect_is(p, "plotly");
# # })
#
# # test_that("Plot two networks", {
# #   p = ena.plot.set(
# #     df.set.lws,
# #     plot.mode="network",
# #     network.one="brandon f.SecondGame",
# #     network.two="arden f.FirstGame"
# #   );
# #
# #   # testthat::expect_is(p, "plotly");
# # })
#
# test_that("Plot a mean trajectory", {
#   # message("Testing a mean trajectory: not implemented")
# })
#
# test_that("Plot a combined plot of units and nodes", {
#   # message("Test for units+nodes: not implemented")
# })
#
#
#
#
